import 'package:flutter/material.dart';

// this app shows usage of SingleChildScrollView widget

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: cards,
        ),
      ),
    );
  }
}


// list of items used in column
List<Widget> cards = List<Widget>.generate(
  100,
  (index) => Card(
    shape: const BorderDirectional(
      bottom: BorderSide(
        color: Colors.black54,
      ),
    ),
    child: ListTile(
      title: Text('$index'),
    ),
  ),
);
