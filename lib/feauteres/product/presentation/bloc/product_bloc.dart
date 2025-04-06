import 'package:bloc_with_dummy/feauteres/product/domain/use_cases/all_product_usecase.dart';
import 'package:bloc_with_dummy/feauteres/product/domain/use_cases/product_usecase.dart';
import 'package:bloc_with_dummy/feauteres/product/presentation/bloc/product_event.dart';
import 'package:bloc_with_dummy/feauteres/product/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/search_product_usecase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductUseCase productUseCase;
  GetAllProductsUseCase getAllProductsUseCase;
  SearchProductsUseCase searchProductsUseCase;

  ProductBloc({
    required this.productUseCase,
    required this.getAllProductsUseCase,
    required this.searchProductsUseCase,
  }) : super(ProductInitial()) {
    on<FetchProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final product = await productUseCase(id: event.id);
        emit(ProductLoaded(product));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await getAllProductsUseCase();
        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
    on<SearchProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await searchProductsUseCase(word: event.word);
        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
