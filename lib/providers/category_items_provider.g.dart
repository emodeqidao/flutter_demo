// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryItemsHash() => r'e1eb0808a40f5f163da4ca873e44c05777c6baa5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CategoryItems
    extends BuildlessAutoDisposeAsyncNotifier<CategoryItemsState> {
  late final String categoryName;

  FutureOr<CategoryItemsState> build(
    String categoryName,
  );
}

/// See also [CategoryItems].
@ProviderFor(CategoryItems)
const categoryItemsProvider = CategoryItemsFamily();

/// See also [CategoryItems].
class CategoryItemsFamily extends Family<AsyncValue<CategoryItemsState>> {
  /// See also [CategoryItems].
  const CategoryItemsFamily();

  /// See also [CategoryItems].
  CategoryItemsProvider call(
    String categoryName,
  ) {
    return CategoryItemsProvider(
      categoryName,
    );
  }

  @override
  CategoryItemsProvider getProviderOverride(
    covariant CategoryItemsProvider provider,
  ) {
    return call(
      provider.categoryName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryItemsProvider';
}

/// See also [CategoryItems].
class CategoryItemsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CategoryItems, CategoryItemsState> {
  /// See also [CategoryItems].
  CategoryItemsProvider(
    String categoryName,
  ) : this._internal(
          () => CategoryItems()..categoryName = categoryName,
          from: categoryItemsProvider,
          name: r'categoryItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryItemsHash,
          dependencies: CategoryItemsFamily._dependencies,
          allTransitiveDependencies:
              CategoryItemsFamily._allTransitiveDependencies,
          categoryName: categoryName,
        );

  CategoryItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryName,
  }) : super.internal();

  final String categoryName;

  @override
  FutureOr<CategoryItemsState> runNotifierBuild(
    covariant CategoryItems notifier,
  ) {
    return notifier.build(
      categoryName,
    );
  }

  @override
  Override overrideWith(CategoryItems Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryItemsProvider._internal(
        () => create()..categoryName = categoryName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryName: categoryName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CategoryItems, CategoryItemsState>
      createElement() {
    return _CategoryItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryItemsProvider && other.categoryName == categoryName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoryItemsRef
    on AutoDisposeAsyncNotifierProviderRef<CategoryItemsState> {
  /// The parameter `categoryName` of this provider.
  String get categoryName;
}

class _CategoryItemsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryItems,
        CategoryItemsState> with CategoryItemsRef {
  _CategoryItemsProviderElement(super.provider);

  @override
  String get categoryName => (origin as CategoryItemsProvider).categoryName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
