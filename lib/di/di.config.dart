// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/repositories/product_repository/data_sources/products_offline_data_sources.dart'
    as _i166;
import '../data/repositories/product_repository/data_sources/products_offline_data_sources_impl.dart'
    as _i483;
import '../data/repositories/product_repository/data_sources/products_remote_data_sources.dart'
    as _i795;
import '../data/repositories/product_repository/data_sources/products_remote_data_sources_impl.dart'
    as _i299;
import '../data/repositories/product_repository/product_repositry.dart'
    as _i939;
import '../data/repositories/product_repository/product_repositry_impl.dart'
    as _i289;
import '../ui/screen/products_screen/products_view_model.dart' as _i265;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i795.ProductsRemoteDataSource>(
        () => _i299.ProductsRemoteDataSourceImpl());
    gh.factory<_i166.ProductsOfflineDataSource>(
        () => _i483.ProductsOfflineDataSourceImpl());
    gh.factory<_i939.ProductRepository>(() => _i289.ProductRepositoryImpl(
          remoteDataSource: gh<_i795.ProductsRemoteDataSource>(),
          offlineDataSource: gh<_i166.ProductsOfflineDataSource>(),
        ));
    gh.factory<_i265.ProductsViewModel>(
        () => _i265.ProductsViewModel(gh<_i939.ProductRepository>()));
    return this;
  }
}
