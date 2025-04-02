import 'package:bloc_with_dummy/feauteres/product/domain/entities/product_entities.dart';

abstract class AllProductState {}

class AllProductInitial extends AllProductState {}

class AllProductLoading extends AllProductState {}

class AllProductLoaded extends AllProductState {
  final AllProducts products;
  AllProductLoaded(this.products);
}

class AllProductError extends AllProductState {
  final String error;
  AllProductError(this.error);
}
