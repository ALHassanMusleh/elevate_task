import 'package:elevate_task/data/api/api_manager.dart';
import 'package:elevate_task/data/model/product.dart';
import 'package:elevate_task/utils/widgets/error_view.dart';
import 'package:elevate_task/utils/widgets/loading_view.dart';
import 'package:elevate_task/utils/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: ApiManager.getProductsList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // throw snapshot.error.toString();
            return ErrorView(
              error: snapshot.error.toString(),
              onClick: () {},
            );
          } else if (snapshot.hasData) {
            return GridView.count(
              padding: EdgeInsets.all(16),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.6,
              children: List.generate(
                snapshot.data!.length,
                (index) => ProductItem(
                  product: snapshot.data![index],
                ),
              ),
            );
          } else {
            return const LoadingView();
          }
        },
      ),
    );
  }
}
