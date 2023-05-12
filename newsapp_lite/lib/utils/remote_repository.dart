import 'package:newsapp_lite/data/article_response_model.dart';
import 'package:http/http.dart' as http;

import '../consts/api_key.dart';
import '../errors/exceptions.dart';

class RemoteRepository {
  /// Calls the https://newsapi.org/v2/everything?q={query}&apiKey={API_KEY} endpoint
  ///
  /// Throws the [ServerException] for all code errors
  Future<List<Article>> getArticlesFromEverything(String query) {
    //print('https://newsapi.org/v2/everything?q=$query&apiKey=$API_KEY');
    return _getArticlesFromUrl(
        'https://newsapi.org/v2/everything?q=$query&apiKey=$API_KEY');
  }

  /// Calls the https://newsapi.org/v2/top-headlines?q={query}&apiKey={API_KEY} endpoint
  ///
  /// Throws the [ServerException] for all code errors
  Future<List<Article>> getArticlesFromTopHeadliners(String query) {
    //print('https://newsapi.org/v2/top-headlines?q=$query&apiKey=$API_KEY');
    return _getArticlesFromUrl(
        'https://newsapi.org/v2/top-headlines?q=$query&apiKey=$API_KEY');
  }

  /// Calls the {url}
  ///
  /// Throws the [ServerException] for all code errors
  Future<List<Article>> _getArticlesFromUrl(String url) async {
    final response = await http
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final articleResponse = articleResponseModelFromJson(response.body);

      return articleResponse.articles;
    } else {
      throw ServerException();
    }
  }
}
