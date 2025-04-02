import '../../domain/entities/category_entities.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() {
    return remoteDataSource.getCategories();
  }
}
