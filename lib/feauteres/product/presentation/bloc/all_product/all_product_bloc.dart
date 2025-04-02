import 'package:bloc_with_dummy/feauteres/product/domain/use_cases/all_product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product_event.dart';
import 'all_product_state.dart';

class ProductsBloc extends Bloc<ProductEvent, AllProductState> {
  GetAllProductsUseCase getAllProductsUseCase;
  ProductsBloc({required this.getAllProductsUseCase})
    : super(AllProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(AllProductLoading());
      try {
        final products = await getAllProductsUseCase();
        emit(AllProductLoaded(products));
      } catch (e) {
        emit(AllProductError(e.toString()));
      }
    });
  }
}
