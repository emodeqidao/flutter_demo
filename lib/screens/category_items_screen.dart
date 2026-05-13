import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/category_state.dart';
import '../providers/category_items_provider.dart';
import 'widgets/category_skeleton.dart';

class CategoryItemsScreen extends ConsumerStatefulWidget {
  final String categoryName;

  const CategoryItemsScreen({
    super.key,
    required this.categoryName,
  });

  @override
  ConsumerState<CategoryItemsScreen> createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends ConsumerState<CategoryItemsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      ref.read(categoryItemsProvider(widget.categoryName).notifier).loadMore(widget.categoryName);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final itemsAsync = ref.watch(categoryItemsProvider(widget.categoryName));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: itemsAsync.when(
        data: (state) {
          if (state.status == CategoryItemsStatus.loading && state.items.isEmpty) {
            return const CategoryGridSkeleton();
          }

          if (state.status == CategoryItemsStatus.failure && state.items.isEmpty) {
            return Center(child: Text(state.errorMessage ?? '加载失败'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(categoryItemsProvider(widget.categoryName).notifier).refresh(widget.categoryName);
            },
            child: CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Card(
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.shopping_bag, size: 48, color: Colors.blue),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  state.items[index],
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text('￥99.00', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        );
                      },
                      childCount: state.items.length,
                    ),
                  ),
                ),
                if (state.isLoadingMore)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  )
                else if (state.hasReachedMax && state.items.isNotEmpty)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: Text('没有更多数据了')),
                    ),
                  ),
              ],
            ),
          );
        },
        loading: () => const CategoryGridSkeleton(),
        error: (err, stack) => Center(child: Text(err.toString())),
      ),
    );
  }
}
