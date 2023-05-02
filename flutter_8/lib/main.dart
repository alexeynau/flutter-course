import 'package:flutter/material.dart';
import 'package:flutter_8/fetch_file.dart';
import 'package:flutter_8/my_app.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()
    );
  }
}
