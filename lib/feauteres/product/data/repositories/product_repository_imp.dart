import '../../domain/entities/all_product_entities.dart';
import '../../domain/entities/product_entities.dart';
import '../../domain/repositories/product_repository.dart'
    show ProductRepository;
import '../data_sources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Product> getSingleProduct({required int id}) {
    return remoteDataSource.getSingleProduct(id: id);
  }

  @override
  Future<AllProducts> getAllProducts() {
    return remoteDataSource.getAllProduct();
  }

  @override
  Future<AllProducts> searchProducts({required String word}) {
    return remoteDataSource.searchProducts(word: word);
  }

  @override
  Future<AllProducts> sortProducts({
    required String sortName,
    required String ascDesc,
  }) {
    return remoteDataSource.sortProducts(sortName: sortName, ascDesc: ascDesc);
  }
}
