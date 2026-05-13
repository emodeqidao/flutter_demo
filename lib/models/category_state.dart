enum CategoryDetailStatus { initial, loading, success, failure }

class CategoryDetailState {
  final CategoryDetailStatus status;
  final List<String> allCategories;
  final List<String> filteredCategories;
  final String searchQuery;

  CategoryDetailState({
    this.status = CategoryDetailStatus.initial,
    this.allCategories = const [],
    this.filteredCategories = const [],
    this.searchQuery = '',
  });

  CategoryDetailState copyWith({
    CategoryDetailStatus? status,
    List<String>? allCategories,
    List<String>? filteredCategories,
    String? searchQuery,
  }) {
    return CategoryDetailState(
      status: status ?? this.status,
      allCategories: allCategories ?? this.allCategories,
      filteredCategories: filteredCategories ?? this.filteredCategories,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

enum CategoryItemsStatus { initial, loading, success, failure }

class CategoryItemsState {
  final CategoryItemsStatus status;
  final List<String> items;
  final bool hasReachedMax;
  final String? errorMessage;
  final bool isLoadingMore;

  CategoryItemsState({
    this.status = CategoryItemsStatus.initial,
    this.items = const [],
    this.hasReachedMax = false,
    this.errorMessage,
    this.isLoadingMore = false,
  });

  CategoryItemsState copyWith({
    CategoryItemsStatus? status,
    List<String>? items,
    bool? hasReachedMax,
    String? errorMessage,
    bool? isLoadingMore,
  }) {
    return CategoryItemsState(
      status: status ?? this.status,
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
