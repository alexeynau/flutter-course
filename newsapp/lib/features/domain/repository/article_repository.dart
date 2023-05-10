import 'package:dartz/dartz.dart';

// TODO: make relative paths
import 'package:newsapp/core/error/failures.dart';
import 'package:newsapp/features/domain/entity/article.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<Article>>> getArticlesFromEverything(String query);
  Future<Either<Failure, List<Article>>> getArticlesFromTopHeadliners();
}