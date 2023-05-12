import 'package:flutter/material.dart';
import 'package:newsapp_lite/pages/news_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NewsPage(),
      theme: ThemeData.dark(
      ),
    );
  }
}
