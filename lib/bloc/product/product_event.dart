part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadProduct extends ProductEvent{


  @override
  List<Object?> get props => [];
}

class UpdateProduct extends ProductEvent{
  final List<Product> products;
  UpdateProduct(this.products);

  @override
  List<Object?> get props => [products];
}