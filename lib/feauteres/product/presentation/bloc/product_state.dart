import 'package:bloc_with_dummy/feauteres/product/domain/entities/product_entities.dart';

import '../../domain/entities/all_product_entities.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;
  ProductLoaded(this.product);
}

class ProductsLoaded extends ProductState {
  final AllProducts products;
  ProductsLoaded(this.products);
}

class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}
