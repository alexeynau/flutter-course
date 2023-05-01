import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: const TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Colors.purple,
              ),
              hintText: 'Введите значение',
              helperText: 'Поле для поиска заметок',
              label: Text('Search'),
              labelStyle:
                  TextStyle(color: Colors.purple, fontWeight: FontWeight.w400),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.purple,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.purple,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
