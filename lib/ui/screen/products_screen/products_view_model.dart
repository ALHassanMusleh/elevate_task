import 'package:elevate_task/data/api/api_manager.dart';
import 'package:elevate_task/data/model/product.dart';
import 'package:elevate_task/data/repositories/product_repository/product_repositry.dart';
import 'package:elevate_task/data/repositories/product_repository/product_repositry_impl.dart';
import 'package:elevate_task/ui/base/base_api_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsViewModelState> {
  ProductRepository productRepository;
  ProductsViewModel(this.productRepository)
      : super(ProductsViewModelState.initial());

  getProducts() async {
    try {
      emit(ProductsViewModelState(BaseLoadingState()));
      List<Product> products = await productRepository.getProducts();
      emit(ProductsViewModelState(BaseSuccessState(products)));
    } catch (e) {
      emit(ProductsViewModelState(BaseErrorState(e.toString())));
    }
  }
}

class ProductsViewModelState {
  late BaseApiState productsApiState;

  ProductsViewModelState(this.productsApiState);
  ProductsViewModelState.initial() {
    productsApiState = BaseLoadingState();
  }
}
