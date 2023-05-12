import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/article_response_model.dart';
import '../errors/exceptions.dart';
import '../utils/favourite_repository.dart';
import '../widgets/article_card.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

    Future<List<Article>> getFavouriteArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStringList = prefs.getStringList(CACHED_ARTICLE);
    if (jsonStringList!.isNotEmpty) {
      return Future.value(jsonStringList
          .map((article) => Article.fromJson(json.decode(article)))
          .toList());
    } else {
      throw CacheException();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Закладки'),
        ),
      ),
      body: FutureBuilder(
        future: getFavouriteArticles(),
        builder: (context, snapshot) {
        switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('Not found');

                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());

                      case ConnectionState.active:
                        return const Center(child: CircularProgressIndicator());

                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          return ListView(
                              children: snapshot.data!
                                  .map((article) =>
                                      ArticleCard(article: article))
                                  .toList());
                        } else {
                          return const Text('Not Found');
                        }
                    };
      }),
      bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper), label: 'Новости'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border), label: 'Закладки'),
            ],
          ),
    );
  }
}
