import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/category_state.dart';

part 'category_items_provider.g.dart';

@riverpod
class CategoryItems extends _$CategoryItems {
  final Map<String, List<String>> _mockData = {
    '水果': ['苹果', '香蕉', '西瓜', '草莓', '葡萄'],
    '海鲜': ['三文鱼', '大龙虾', '生蚝', '帝王蟹', '扇贝'],
    '烘焙': ['全麦面包', '巧克力蛋糕', '牛角包', '芝士蛋糕', '蛋挞'],
    '肉禽': ['鸡胸肉', '五花肉', '牛排', '羊小排', '鸭腿'],
    '蔬菜': ['西兰花', '菠菜', '胡萝卜', '土豆', '西红柿'],
    '零食': ['薯片', '巧克力棒', '坚果', '糖果', '爆米花'],
    '酒水': ['精酿啤酒', '红葡萄酒', '白酒', '气泡水', '橙汁'],
    '粮油': ['东北大米', '花生油', '挂面', '白砂糖', '酱油'],
  };

  @override
  FutureOr<CategoryItemsState> build(String categoryName) async {
    return _fetchItems(categoryName);
  }

  Future<CategoryItemsState> _fetchItems(String categoryName) async {
    state = AsyncValue.data(CategoryItemsState(status: CategoryItemsStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    final baseItems = _mockData[categoryName] ?? ['商品 A', '商品 B'];
    return CategoryItemsState(
      status: CategoryItemsStatus.success,
      items: baseItems,
      hasReachedMax: false,
    );
  }

  Future<void> refresh(String categoryName) async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _fetchItems(categoryName));
  }

  Future<void> loadMore(String categoryName) async {
    final currentState = state.value;
    if (currentState == null || currentState.hasReachedMax || currentState.isLoadingMore) return;

    state = AsyncValue.data(currentState.copyWith(isLoadingMore: true));
    
    await Future.delayed(const Duration(seconds: 1));
    
    final nextBatch = currentState.items.map((item) => '$item (更多)').toList();
    
    state = AsyncValue.data(currentState.copyWith(
      isLoadingMore: false,
      items: List.of(currentState.items)..addAll(nextBatch),
      hasReachedMax: currentState.items.length >= 15,
    ));
  }
}
