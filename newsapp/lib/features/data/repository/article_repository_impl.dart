import 'package:newsapp/core/error/exceptions.dart';
import 'package:newsapp/features/data/datasource/article_local_datasource.dart';
import 'package:newsapp/features/data/datasource/article_remote_datasource.dart';
import 'package:newsapp/features/domain/entity/article.dart';
import 'package:newsapp/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:newsapp/features/domain/repository/article_repository.dart';

import 'package:newsapp/core/network/network_info.dart';

typedef Future<List<Article>> _EverythingOrTopHeadlinersChooser();

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;
  final ArticleLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ArticleRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  /// returns [List\<Article\>] from v2/everything endpoint remote data source or from cache
  ///
  /// can returns [ServerFailure] or [CacheFailure] depending on exception
  @override
  Future<Either<Failure, List<Article>>> getArticlesFromEverything(
      String query) async {
    return await _getArticles(() {
      return remoteDataSource.getArticlesFromEverything(query);
    });
  }

  /// returns [List\<Article\>] from v2/top-headliners endpoint remote data source or from cache
  ///
  /// can returns [ServerFailure] or [CacheFailure] depending on exception
  @override
  Future<Either<Failure, List<Article>>> getArticlesFromTopHeadliners() async {
    return await _getArticles(() {
      return remoteDataSource.getArticlesFromTopHeadliners();
    });
  }


  /// returns [List\<Article\>] according to function gotten in params
  /// 
  /// can returns [ServerFailure] or [CacheFailure] depending on exception
  Future<Either<Failure, List<Article>>> _getArticles(
      _EverythingOrTopHeadlinersChooser getFromEverythingOrTopHeadliners) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteArticles =
            await remoteDataSource.getArticlesFromTopHeadliners();
        localDataSource.cacheArticles(remoteArticles);
        return Right(remoteArticles);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localArticles = await localDataSource.getLastArticles();
        return Right(localArticles);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
