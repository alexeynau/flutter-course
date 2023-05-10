import 'package:newsapp/features/domain/entity/article.dart';

class ArticleModel extends Article {
  ArticleModel({
    required String title,
    required String description,
    required String urlToImage,
    required DateTime publishedAt,
  }) : super(
            title: title,
            description: description,
            urlToImage: urlToImage,
            publishedAt: publishedAt);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.toString(),
    };
  }
}
