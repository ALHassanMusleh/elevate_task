import 'package:elevate_task/data/model/product.dart';
import 'package:elevate_task/data/repositories/product_repository/data_sources/products_offline_data_sources.dart';

class ProductsOfflineDataSourceImpl extends ProductsOfflineDataSource {
  @override
  Future<List<Product>> getProducts() async {
    List<Product> products = [];

    /// this is get Products Offline data source must return List<Product>
    /// This fun return product list empty for this is sample for Reposity Pattern
    return products;
  }
}
