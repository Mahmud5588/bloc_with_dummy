abstract class ProductEvent {
  const ProductEvent();
}

class FetchProduct extends ProductEvent {
  final int id;
  FetchProduct({required this.id});
}

class FetchProducts extends ProductEvent {}
