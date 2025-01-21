import 'package:elevate_task/data/api/api_manager.dart';
import 'package:elevate_task/data/model/product.dart';
import 'package:elevate_task/data/repositories/product_repository/data_sources/products_offline_data_sources.dart';
import 'package:elevate_task/data/repositories/product_repository/data_sources/products_remote_data_sources.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
