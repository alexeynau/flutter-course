import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entity/article.dart';
import '../repository/article_repository.dart';

class GetArticlesFromTopHeadliners implements UseCase<List<Article>, NoParams> {
  final ArticleRepository repository;

  GetArticlesFromTopHeadliners(this.repository);

  @override
   Future<Either<Failure, List<Article>>> call(NoParams params) async {
    return await repository.getArticlesFromTopHeadliners();
   }
}

