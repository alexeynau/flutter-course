import 'package:flutter/material.dart';

// home page that contains drawer

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
      appBar: AppBar(),
      body: const Center(
        child: Text('HomePage'),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                child: const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
              ),
              TextButton(
                child: const Text('Albums'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/albums');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
