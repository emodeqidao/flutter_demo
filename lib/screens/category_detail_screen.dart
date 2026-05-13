import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/category_state.dart';
import '../providers/category_detail_provider.dart';
import 'widgets/category_skeleton.dart';

class CategoryDetailScreen extends ConsumerWidget {
  const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CategoryDetailView();
  }
}

class CategoryDetailView extends ConsumerStatefulWidget {
  const CategoryDetailView({super.key});

  @override
  ConsumerState<CategoryDetailView> createState() => _CategoryDetailViewState();
}

class _CategoryDetailViewState extends ConsumerState<CategoryDetailView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryDetailAsync = ref.watch(categoryDetailProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('分类详情'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '搜索分类...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    ref.read(categoryDetailProvider.notifier).search('');
                  },
                ),
              ),
              onChanged: (value) {
                ref.read(categoryDetailProvider.notifier).search(value);
              },
            ),
          ),
          Expanded(
            child: categoryDetailAsync.when(
              data: (state) {
                if (state.status == CategoryDetailStatus.loading) {
                  return const CategoryListSkeleton();
                }
                if (state.filteredCategories.isEmpty) {
                  return const Center(child: Text('未找到相关分类'));
                }
                return ListView.separated(
                  itemCount: state.filteredCategories.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final category = state.filteredCategories[index];
                    return ListTile(
                      leading: const Icon(Icons.category),
                      title: Text(category),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.push('/category-items/$category');
                      },
                    );
                  },
                );
              },
              loading: () => const CategoryListSkeleton(),
              error: (err, stack) => const Center(child: Text('加载失败')),
            ),
          ),
        ],
      ),
    );
  }
}
