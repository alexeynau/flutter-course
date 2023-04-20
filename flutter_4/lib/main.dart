import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<String> nav = ['Cats', 'Dogs'];
  final List<String> catsList = [
    'assets/images/cat1.jpg',
    'assets/images/cat2.jpg',
    'assets/images/cat3.jpg'
  ];
  final List<String> dogsList = [
    'assets/images/dog1.jpg',
    'assets/images/dog2.jpg',
    'assets/images/dog3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: nav.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Photos'),
              bottom: TabBar(
                  tabs: nav.map((String item) => Tab(text: item)).toList()),
            ),
            body: TabBarView(children: [
              ListView(
                key: PageStorageKey(nav[0]),
                children: catsList
                  .map((photo) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(photo),
                      ))
                  .toList(),
              ),
              ListView(
                key: PageStorageKey(nav[1]),
                children: dogsList
                  .map((photo) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(photo),
                      ))
                  .toList(),
              ),
            ]),
          )),
    );
  }
}
