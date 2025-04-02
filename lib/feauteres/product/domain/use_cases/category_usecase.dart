import '../entities/category_entities.dart';
import '../repositories/category_repository.dart' show CategoryRepository;

class CategoryUseCase {
  final CategoryRepository repository;

  CategoryUseCase(this.repository);

  Future<List<Category>> getCategories() {
    return repository.getCategories();
  }
}
