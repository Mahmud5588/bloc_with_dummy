import '../entities/product_entities.dart' show AllProducts;
import '../repositories/product_repository.dart';

class SortProductsUseCase {
  final ProductRepository repository;

  SortProductsUseCase(this.repository);

  Future<AllProducts> call({
    required String sortName,
    required String ascDesc,
  }) {
    return repository.sortProducts(sortName: sortName, ascDesc: ascDesc);
  }
}
