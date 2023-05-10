import 'package:dartz/dartz.dart';
import 'package:newsapp/features/domain/entity/article.dart';
import 'package:newsapp/features/domain/repository/article_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp/features/domain/usecases/get_articles_from_everything.dart';

class MockArticleRepository extends Mock implements ArticleRepository {}

void main() {
  GetArticlesFromEverything usecase;
  MockArticleRepository mockArticleRepository;

  setUp(() {
    mockArticleRepository = MockArticleRepository();
    usecase = GetArticlesFromEverything(mockArticleRepository);
  });

  final tArticles = [
    Article(
        title: 'title',
        description: 'description',
        urlToImage: 'urlToImage',
        publishedAt: DateTime(2)),
    Article(
        title: 'title2',
        description: 'description2',
        urlToImage: 'urlToImage2',
        publishedAt: DateTime(3)),
  ];

  // test(
  //   'shoulg get list of articles from the repository',
  //   () async {
  //     // arrange
  //     when(mockArticleRepository.getArticlesFromEverything()).thenAnswer((_) => Right(tArticles));
  //     // act

  //     // assert
  //   },
  // );
}
