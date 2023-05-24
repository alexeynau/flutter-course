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
      theme: ThemeData.from(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.deepOrange[100]!,
            onPrimary: Colors.deepOrange[100]!,
            secondary: Colors.deepOrange[100]!,
            onSecondary: Colors.deepOrange[100]!,
            error: Colors.deepOrange[100]!,
            onError: Colors.deepOrange[100]!,
            background: Colors.black54,
            onBackground: Colors.deepOrange[100]!,
            surface: Colors.black54,
            onSurface: Colors.black54),
      ),
    );
  }
}
