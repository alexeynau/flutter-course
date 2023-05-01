import 'package:flutter/material.dart';
import 'package:flutter_7/pages/artists_list_page.dart';
import 'package:flutter_7/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            );
          case ArtistListPage.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) => const ArtistListPage(),
            );
          default:
        }
      },
    );
  }
}
