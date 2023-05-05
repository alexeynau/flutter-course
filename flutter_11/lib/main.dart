import 'package:flutter/material.dart';
import 'package:flutter_11/pages/home_page.dart';

//this app shos usage of hero animation

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
