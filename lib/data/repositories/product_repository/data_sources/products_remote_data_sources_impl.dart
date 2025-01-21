import 'package:elevate_task/data/api/api_manager.dart';
import 'package:elevate_task/data/model/product.dart';
import 'package:elevate_task/data/repositories/product_repository/data_sources/products_remote_data_sources.dart';

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  @override
  Future<List<Product>> getProducts() async {
    return await ApiManager.getProductsList();
  }
}
