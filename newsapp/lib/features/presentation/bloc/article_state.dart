part of 'article_bloc.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class Empty extends ArticleState {}

class Loading extends ArticleState {}

class Loaded extends ArticleState {
  final List<Article> articles;

  const Loaded({required this.articles});
}

class Error extends ArticleState {
  final String message;

  const Error({required this.message});
}
