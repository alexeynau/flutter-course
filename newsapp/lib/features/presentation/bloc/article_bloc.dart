import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsapp/features/domain/entity/article.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(Empty()) {
    on<ArticleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
