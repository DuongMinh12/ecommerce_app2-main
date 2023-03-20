import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';
import '../../repositories/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categoruSubscription;
  CategoryBloc({required CategoryRepository categoruRepository}) : _categoryRepository = categoruRepository, super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if(event is LoadCategory){
      yield* _mapLoadCategoriesToState();
    }
    if(event is UpdateCategory){
      yield* _mapUpdateCategoriesToState(event);
    }
  }

  Stream<CategoryState>_mapLoadCategoriesToState() async* {
    _categoruSubscription?.cancel();
    _categoruSubscription = _categoryRepository.getAllCategories().listen((categories) => add(UpdateCategory(categories)));
  }

  Stream<CategoryState>_mapUpdateCategoriesToState(UpdateCategory event) async*{
    yield CategoryLoaded(categories: event.categories);
  }

}
