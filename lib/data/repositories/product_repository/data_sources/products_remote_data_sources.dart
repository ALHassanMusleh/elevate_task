import 'package:elevate_task/data/api/api_manager.dart';
import 'package:elevate_task/data/model/product.dart';

abstract class ProductsRemoteDataSource {
  Future<List<Product>> getProducts();
}
