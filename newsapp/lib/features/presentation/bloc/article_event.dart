part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class GetArticlesFromEverything extends ArticleEvent {
  final String query;

  GetArticlesFromEverything(this.query);
}
class GetArticlesFromTopHealiners extends ArticleEvent {}