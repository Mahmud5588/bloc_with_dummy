import 'all_product_entities.dart';

class AllProducts {
  List<Product> products;
  int total;
  int skip;
  int limit;

  AllProducts({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
