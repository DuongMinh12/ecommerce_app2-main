part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategory extends CategoryEvent{


  @override
  List<Object?> get props => [];
}

class UpdateCategory extends CategoryEvent{
  final List<Category> categories;
  UpdateCategory(this.categories);

  @override
  List<Object?> get props => [categories];
}
