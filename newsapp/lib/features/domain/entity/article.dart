import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String description;
  final String urlToImage;
  final DateTime publishedAt;

  const Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  }); 

  @override
  // implement props
  List<Object?> get props => [
          title,
          description,
          urlToImage,
          publishedAt,
        ];
}
