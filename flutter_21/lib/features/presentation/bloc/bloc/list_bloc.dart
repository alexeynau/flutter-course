import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import '../../../data/repositories/repository_impl.dart';
import '../../../domain/repositories/repository.dart';
import 'package:meta/meta.dart';

import '../../../data/models/category_model.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  Repository repository = RepositoryImpl();
  List<Category> categories = [];
  List<Uint8List> photos = [];
  ListBloc() : super(ListInitial()) {
    on<ListInit>((event, emit) async {
      categories = await repository.loadCategories();
      photos = await repository.loadPhotos();
      emit(ListInitial());
    });

    on<AddToCategoryListEvent>((event, emit) {
      repository.addCategory(event.category);
      emit(NewCategoryAddedState());
    });

    on<AddToPhotoListEvent>((event, emit) async {
      repository.addPhoto(event.url);
      photos = await repository.loadPhotos();
      emit(NewPhotoAdded());
    });
  }
}
