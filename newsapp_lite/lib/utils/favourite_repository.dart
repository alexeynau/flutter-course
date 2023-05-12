import 'dart:convert';
import '../data/article_response_model.dart';
import '../errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CACHED_ARTICLE = 'CACHED_ARTICLES';

class ArticleLocalDataSource {
  final SharedPreferences sharedPreferences;

  ArticleLocalDataSource({required this.sharedPreferences});

  @override
  Future<List<Article>> getFavouriteArticles() {
    final jsonStringList = sharedPreferences.getStringList(CACHED_ARTICLE);
    if (jsonStringList!.isNotEmpty) {
      return Future.value(jsonStringList
          .map((article) => Article.fromJson(json.decode(article)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheArticles(Article articleToCache) {
    final String jsonArticle = articleToCache.toJson().toString();

    sharedPreferences.setString(
      CACHED_ARTICLE,
      jsonArticle,
    );

    return Future.value(jsonArticle);
  }
}