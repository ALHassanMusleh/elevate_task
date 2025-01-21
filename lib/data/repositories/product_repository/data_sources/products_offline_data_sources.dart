import 'package:elevate_task/data/model/product.dart';

abstract class ProductsOfflineDataSource {
  Future<List<Product>> getProducts();
}
