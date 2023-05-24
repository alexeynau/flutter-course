import 'package:flutter/material.dart';
import 'package:flutter_14/features/presentation/pages/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      // home: Scaffold(
      //   appBar: AppBar(),
      // ),
    );
  }
}
