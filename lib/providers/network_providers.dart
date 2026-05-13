import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/data_repository.dart';

part 'network_providers.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio();
}

@riverpod
DataRepository dataRepository(DataRepositoryRef ref) {
  return DataRepository(dio: ref.watch(dioProvider));
}

@riverpod
class NetworkData extends _$NetworkData {
  @override
  Future<String> build() async {
    final repository = ref.watch(dataRepositoryProvider);
    return repository.fetchData();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(dataRepositoryProvider);
      return repository.fetchData();
    });
  }
}
