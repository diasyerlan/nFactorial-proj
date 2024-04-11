import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    tabBarTheme: TabBarTheme(dividerColor: Colors.grey[300]),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[300],
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.grey.shade700,
        tertiary: Colors.grey.shade200,
        secondary: Colors.black,
        inversePrimary: Colors.grey.shade800),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ));
