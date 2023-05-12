import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp_lite/data/article_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleCard extends StatefulWidget {
  final Article article;
  const ArticleCard({super.key, required this.article});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {

  static const String CACHED_ARTICLE = 'CACHED_ARTICLE';
  // this function will save the name to the shared preferences
  Future<void> _saveArticle(Article article) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(CACHED_ARTICLE, json.encode( article.toJson()));
  }

  // this function will clear the name from the shared preferences
  Future<void> _clearArticle(Article article) async {
    final prefs = await SharedPreferences.getInstance();
    // Check where the name is saved before or not
    if (!prefs.containsKey(CACHED_ARTICLE)) {
      return;
    }

    await prefs.remove(CACHED_ARTICLE);
  }

  bool isLiked = false;
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 100,
      child: ListTile(
        leading: (widget.article.urlToImage != null)
            ? Image.network(
                widget.article.urlToImage!,
                width: 90,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 90,
                  child: Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
                  ),
                ),
              )
            : const SizedBox(
                width: 90,
                child: Icon(
                  Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
                ),
              ),
        title: Text(widget.article.title),
        subtitle: Text(widget.article.description),
        trailing: IconButton(
          onPressed: () {
            
            setState(() {
              isLiked = !isLiked;
              color = isLiked ? Colors.red : Colors.grey;
              isLiked ? _clearArticle(widget.article) : _saveArticle(widget.article);
            });
          },
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_outline_outlined,
            fill: 1,
            color: color,
          ),
        ),
      ),
    );
  }
}
