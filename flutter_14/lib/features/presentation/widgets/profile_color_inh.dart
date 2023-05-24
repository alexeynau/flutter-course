import 'package:flutter/material.dart';

class MainThemeStyle extends InheritedWidget {
  final MainTheme theme;
  const MainThemeStyle({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(child: child, key: key);

  static MainTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<MainThemeStyle>();
    assert(result != null, "No MainThemeStyle found");
    return result!.theme;
  }

  @override
  bool updateShouldNotify(MainThemeStyle oldWidget) {
    // return theme != oldWidget.theme;
    return true;
  }
}

class MainTheme {
  final Color bgColor;
  final Color headerColor;
  final double textSize;
  final Color textColor;
  final Color buttonBg;
  final Color buttonFg;
  MainTheme({
    required this.textSize,
    required this.bgColor,
    required this.headerColor,
    required this.textColor,
    required this.buttonBg,
    required this.buttonFg,
  });
}
