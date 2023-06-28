part of 'list_bloc.dart';

@immutable
abstract class ListState {}

class ListInitial extends ListState {}

class NewCategoryAddedState extends ListState {}

class NewPhotoAdded extends ListState {}
