import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/category_state.dart';

part 'category_detail_provider.g.dart';

@riverpod
class CategoryDetail extends _$CategoryDetail {
  final List<String> _initialCategories = [
    '水果',
    '海鲜',
    '烘焙',
    '肉禽',
    '蔬菜',
    '零食',
    '酒水',
    '粮油',
  ];

  @override
  FutureOr<CategoryDetailState> build() async {
    return _loadInitial();
  }

  Future<CategoryDetailState> _loadInitial() async {
    state = AsyncValue.data(CategoryDetailState(status: CategoryDetailStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    final newState = CategoryDetailState(
      status: CategoryDetailStatus.success,
      allCategories: _initialCategories,
      filteredCategories: _initialCategories,
    );
    return newState;
  }

  void search(String query) {
    if (state.value == null) return;
    
    final currentState = state.value!;
    final normalizedQuery = query.toLowerCase();
    
    if (normalizedQuery.isEmpty) {
      state = AsyncValue.data(currentState.copyWith(
        searchQuery: '',
        filteredCategories: currentState.allCategories,
      ));
      return;
    }

    final filtered = currentState.allCategories.where((category) {
      return category.toLowerCase().contains(normalizedQuery);
    }).toList();

    state = AsyncValue.data(currentState.copyWith(
      searchQuery: query,
      filteredCategories: filtered,
    ));
  }
}
