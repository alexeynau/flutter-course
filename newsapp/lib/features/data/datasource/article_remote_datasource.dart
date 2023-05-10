import 'dart:convert';

import 'package:newsapp/core/error/exceptions.dart';
import 'package:newsapp/features/data/models/article_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/consts/api_key.dart';

abstract class ArticleRemoteDataSource {
  /// Calls the https://newsapi.org/v2/everything?q={query}&apiKey=API_KEY endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<ArticleModel>> getArticlesFromEverything(String query);

  /// Calls the https://newsapi.org/v2/top-headlines?country=ru&apiKey=API_KEY endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<ArticleModel>> getArticlesFromTopHeadliners();
}

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final http.Client client;

  ArticleRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ArticleModel>> getArticlesFromEverything(String query) async {
    return _getArticlesFromUrl(
        'https://newsapi.org/v2/everything?q=$query&apiKey=$API_KEY');
  }

  @override
  Future<List<ArticleModel>> getArticlesFromTopHeadliners() {
    return _getArticlesFromUrl(
        'https://newsapi.org/v2/top-headlines?country=ru&apiKey=$API_KEY');
  }


  /// Calls the {url} endpoit
  /// 
  /// Throws a [ServerException] for all error codes
  Future<List<ArticleModel>> _getArticlesFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final articles = json.decode(response.body);
      return (articles['articles'] as List)
          .map((article) => ArticleModel.fromJson(article))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
