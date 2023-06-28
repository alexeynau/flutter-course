part of 'list_bloc.dart';

@immutable
abstract class ListEvent {}

class ListInit implements ListEvent {}

class AddToPhotoListEvent implements ListEvent {
  final String url;

  AddToPhotoListEvent(this.url);
}

class AddToCategoryListEvent implements ListEvent {
  final Category category;

  AddToCategoryListEvent(this.category);
}
