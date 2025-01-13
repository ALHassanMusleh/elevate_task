import 'dart:convert';

import 'package:elevate_task/data/model/product.dart';
import 'package:http/http.dart';

abstract class ApiManager {
  static const String _baseUrl = 'https://fakestoreapi.com';
  static const String _productsEndPoint = '/products';

  static Future<List<Product>> getProductsList() async {
    List<Product> productsList = [];
    Response serverResponse =
        await get(Uri.parse('$_baseUrl$_productsEndPoint'));

    if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
      dynamic list = jsonDecode(serverResponse.body);
      list.forEach((v) {
        productsList.add(Product.fromJson(v));
      });
      return productsList;
    } else {
      throw 'Something went wrong please try again later';
    }
  }
}
