import 'package:flutter/material.dart';
import 'package:newsapp_lite/data/article_response_model.dart';
import 'package:newsapp_lite/widgets/article_card.dart';

class NewsBuilder extends StatelessWidget {
  
  final Future<List<Article>> future;
  const NewsBuilder({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
                        future: future,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.done:
                              if (snapshot.hasData) {
                                return ListView(
                                    children: snapshot.data!
                                        .map(
                                          (article) =>
                                              ArticleCard(article: article),
                                        )
                                        .toList());
                              } else {
                                return const Text('Not Found');
                              }
                            default:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                          }
                        },
                      );
  }
}