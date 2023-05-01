import 'package:flutter/material.dart';
import 'package:flutter_7/pages/artistpage.dart';
import 'package:flutter_7/pages/artists_list_page.dart';
import 'package:flutter_7/pages/home_page.dart';

// this app shows usage of Navigation in Flutter App and parsing json from a server

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
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

          case ArtistPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (BuildContext context) {
                if (args.containsKey('album')) {
                  return ArtistPage(album: args['album']);
                }
                return const Text('Not Found');
              },
            );
          
          default:
        }
      },
    );
  }
}
