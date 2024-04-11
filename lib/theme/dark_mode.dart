import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    tabBarTheme: TabBarTheme(dividerColor: Colors.grey[900]),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primary: Colors.white,
        secondary: Colors.white,
        tertiary: Colors.grey.shade800,
        inversePrimary: Colors.grey.shade300),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.grey[300],
          displayColor: Colors.white,
        ));
