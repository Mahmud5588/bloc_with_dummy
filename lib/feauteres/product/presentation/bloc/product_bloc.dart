import 'package:bloc_with_dummy/feauteres/product/domain/use_cases/product_usecase.dart';
import 'package:bloc_with_dummy/feauteres/product/presentation/bloc/product_event.dart';
import 'package:bloc_with_dummy/feauteres/product/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductUseCase productUseCase;

  ProductBloc({required this.productUseCase}) : super(ProductInitial()) {
    on<FetchProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final product = await productUseCase(id: event.id);
        emit(ProductLoaded(product));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
