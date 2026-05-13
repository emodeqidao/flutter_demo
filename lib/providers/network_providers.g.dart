// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'58eeefbd0832498ca2574c1fe69ed783c58d1d8f';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$dataRepositoryHash() => r'38acd8ea184a5d3bd30bc75440e82ee9d4200084';

/// See also [dataRepository].
@ProviderFor(dataRepository)
final dataRepositoryProvider = AutoDisposeProvider<DataRepository>.internal(
  dataRepository,
  name: r'dataRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dataRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DataRepositoryRef = AutoDisposeProviderRef<DataRepository>;
String _$networkDataHash() => r'f6d3748c434dcc78f7fd199b2e307760a997b3d7';

/// See also [NetworkData].
@ProviderFor(NetworkData)
final networkDataProvider =
    AutoDisposeAsyncNotifierProvider<NetworkData, String>.internal(
  NetworkData.new,
  name: r'networkDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$networkDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkData = AutoDisposeAsyncNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
