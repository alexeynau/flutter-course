import 'package:flutter/material.dart';
import 'package:flutter_9/pages/hotel_page.dart';
import 'package:flutter_9/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          
          case HomePage.routeName:
            return MaterialPageRoute(builder: (builder) => const HomePage());
          case HotelPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            if (args.containsKey('hotel')) {
              return MaterialPageRoute(builder: (builder) => HotelPage(
                hotel: args['hotel'],
              ));
            }
            return MaterialPageRoute(builder: (builder) => const HomePage());
          default:
        }
      },
      home: const HomePage(),
    );
  }
}
