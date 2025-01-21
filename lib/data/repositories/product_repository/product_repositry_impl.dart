import 'package:elevate_task/data/model/product.dart';
import 'package:elevate_task/data/repositories/product_repository/data_sources/products_offline_data_sources.dart';
import 'package:elevate_task/data/repositories/product_repository/data_sources/products_offline_data_sources_impl.dart';
import 'package:elevate_task/data/repositories/product_repository/data_sources/products_remote_data_sources.dart';
import 'package:elevate_task/data/repositories/product_repository/data_sources/products_remote_data_sources_impl.dart';
import 'package:elevate_task/data/repositories/product_repository/product_repositry.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductsRemoteDataSource remoteDataSource;
  ProductsOfflineDataSource offlineDataSource;
  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.offlineDataSource,
  });

  @override
  Future<List<Product>> getProducts() async {
    bool isConnected = await InternetConnectionChecker.instance.hasConnection;
    if (isConnected) {
      return await remoteDataSource.getProducts();
    } else {
      // This is offline source when not connected
      return offlineDataSource.getProducts();
    }
  }
}
