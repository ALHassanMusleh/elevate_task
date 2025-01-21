import 'package:elevate_task/data/model/product.dart';
import 'package:elevate_task/data/repositories/product_repository/data_sources/products_offline_data_sources_impl.dart';
import 'package:elevate_task/data/repositories/product_repository/data_sources/products_remote_data_sources_impl.dart';
import 'package:elevate_task/data/repositories/product_repository/product_repositry_impl.dart';
import 'package:elevate_task/di/di.dart';
import 'package:elevate_task/ui/base/base_api_state.dart';
import 'package:elevate_task/ui/screen/products_screen/products_view_model.dart';
import 'package:elevate_task/utils/widgets/error_view.dart';
import 'package:elevate_task/utils/widgets/loading_view.dart';
import 'package:elevate_task/utils/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsViewModel productsViewModel = getIt();

  @override
  void initState() {
    productsViewModel.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocBuilder<ProductsViewModel, ProductsViewModelState>(
          bloc: productsViewModel,
          builder: (context, state) {
            if (state.productsApiState is BaseSuccessState) {
              BaseSuccessState baseSuccessState =
                  state.productsApiState as BaseSuccessState<List<Product>>;
              return buildProductsList(baseSuccessState.data);
            } else if (state.productsApiState is BaseErrorState) {
              BaseErrorState baseErrorState =
                  state.productsApiState as BaseErrorState;
              return ErrorView(
                  error: baseErrorState.error,
                  onClick: () {
                    productsViewModel.getProducts();
                  });
            } else {
              return const LoadingView();
            }
          }),
    );
    BlocBuilder<ProductsViewModel, ProductsViewModelState>(
        builder: (context, state) {
      if (state.productsApiState is BaseSuccessState) {
        BaseSuccessState baseSuccessState =
            state.productsApiState as BaseSuccessState<List<Product>>;
        return buildProductsList(baseSuccessState.data);
      } else if (state.productsApiState is BaseErrorState) {
        BaseErrorState baseErrorState =
            state.productsApiState as BaseErrorState;
        return ErrorView(
            error: baseErrorState.error,
            onClick: () {
              productsViewModel.getProducts();
            });
      } else {
        return const LoadingView();
      }
    });
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Products'),
    //   ),
    //   body: FutureBuilder<List<Product>>(
    //     future: ApiManager.getProductsList(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         // throw snapshot.error.toString();
    //         return ErrorView(
    //           error: snapshot.error.toString(),
    //           onClick: () {},
    //         );
    //       } else if (snapshot.hasData) {
    //         return Padding(
    //           padding: const EdgeInsets.all(12.0),
    //           child: GridView.builder(
    //             itemCount: snapshot.data?.length,
    //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               mainAxisSpacing: 12,
    //               crossAxisSpacing: 12,
    //               childAspectRatio: 1 / 1.6,
    //             ),
    //             itemBuilder: (context, index) => ProductItem(
    //               product: snapshot.data![index],
    //             ),
    //           ),
    //         );
    //       } else {
    //         return const LoadingView();
    //       }
    //     },
    //   ),
    // );
  }

  Padding buildProductsList(List<Product> products) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1 / 1.6,
        ),
        itemBuilder: (context, index) => ProductItem(
          product: products[index],
        ),
      ),
    );
  }
}
