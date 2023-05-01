import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('HomePage'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            TextButton(
              child: const Text('Home'),
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            TextButton(
              child: const Text('Albums'),
              onPressed: () {Navigator.of(context).pushNamed('/albums');},
            ),
          ],
        ),
      ),
    );
  }
}
