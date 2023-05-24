import 'package:flutter/material.dart';
import 'package:simple_state_managment/presentation/my_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}
