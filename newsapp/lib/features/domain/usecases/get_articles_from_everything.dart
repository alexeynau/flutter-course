import 'package:dartz/dartz.dart';
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/features/domain/repository/article_repository.dart';

import '../../../core/error/failures.dart';
import '../entity/article.dart';

class GetArticlesFromEverything implements UseCase<List<Article>, String> {
  final ArticleRepository repository;

  GetArticlesFromEverything(this.repository);

  @override
   Future<Either<Failure, List<Article>>> call(String query) async {
    return await repository.getArticlesFromEverything(query);
   }
}