import 'dart:convert';

import 'package:newsapp/core/error/exceptions.dart';
import 'package:newsapp/features/data/models/article_model.dart';
import 'package:newsapp/features/domain/entity/article.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ArticleLocalDataSource {
  /// Gets the cached [List<ArticleModel>]
  ///
  /// Throws [CacheException] ifno cached data is present
  Future<List<ArticleModel>> getLastArticles();


  /// caches the [List\<Article\>] got in params
  Future<void> cacheArticles(List<ArticleModel> articlesToCache);
}

const CACHED_ARTICLES = 'CACHED_ARTICLES';

class ArticleLocalDataSourceImpl implements ArticleLocalDataSource {
  final SharedPreferences sharedPreferences;

  ArticleLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ArticleModel>> getLastArticles() {
    final jsonStringList = sharedPreferences.getStringList(CACHED_ARTICLES);
    if (jsonStringList!.isNotEmpty) {
      return Future.value(jsonStringList
          .map((article) => ArticleModel.fromJson(json.decode(article)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheArticles(List<ArticleModel> articlesToCache) {
    final List<String> jsonArticlesList = articlesToCache
        .map((article) => json.encode(article.toJson()))
        .toList();

    sharedPreferences.setStringList(
      CACHED_ARTICLES,
      jsonArticlesList,
    );

    return Future.value(jsonArticlesList);
  }
}
