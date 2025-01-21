import 'package:elevate_task/data/api/api_manager.dart';
import 'package:elevate_task/data/model/product.dart';
import 'package:elevate_task/ui/base/base_api_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewModel extends Cubit<ProductsViewModelState> {
  ProductsViewModel() : super(ProductsViewModelState.initial());

  getProducts() async {
    try {
      emit(ProductsViewModelState(BaseLoadingState()));
      List<Product> products = await ApiManager.getProductsList();
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
