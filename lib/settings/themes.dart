import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
  primaryColor: Colors.white,
  textTheme: const TextTheme(
    button: TextStyle(color: Colors.white70),
    bodyText2: TextStyle(fontSize: 18.0),
  ),
  // brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    // centerTitle: true,
    elevation: 0.0,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.blue,
    brightness: Brightness.light,
    // onSurface: Colors.black26,
  ),
);

ThemeData darkThemeData = ThemeData(
  primaryColor: Colors.black,
  textTheme: const TextTheme(
    button: TextStyle(color: Colors.black54),
    bodyText2: TextStyle(fontSize: 18.0),
  ),
  // brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    // centerTitle: true,
    elevation: 0.0,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.blue,
    brightness: Brightness.dark,
  ),
);
