import 'package:flutter/material.dart';
import 'package:flutter_10/pages/sign_in_page.dart';
import 'package:flutter_10/pages/sign_up_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SignUpPage.routeName:
            return MaterialPageRoute(builder: (context) => const SignUpPage());
          case SignInPage.routeName:
            return MaterialPageRoute(builder: (context) => const SignInPage());
          default:
            return MaterialPageRoute(builder: (context) => const SignUpPage());
        }
      },
      home: SignInPage(),
    );
  }
}
