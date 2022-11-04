import 'package:flutter/material.dart';

// Application theme.
//######################################################################
class BeyondTheme {
  static const Color primary = Colors.red;
  static const Color secondary = Colors.indigo;
  static const Color terciary = Colors.deepPurpleAccent;

  // Theme modes.
  //###################################################################

  // Light theme.
  //----------------------------------------------------------------------
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      iconTheme: const IconThemeData(color: Colors.white),
      buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
      shadowColor: Colors.grey,
      cardTheme: const CardTheme(shadowColor: Colors.grey),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primary)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 5),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              shape: const StadiumBorder(),
              elevation: 0)));

  // Dark theme.
  //----------------------------------------------------------------------
  static final ThemeData darkTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(color: Colors.black, elevation: 0),
      iconTheme: const IconThemeData(color: Colors.white),
      buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
      shadowColor: Colors.black,
      cardTheme: const CardTheme(shadowColor: Colors.black),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.white)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 5),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              shape: const StadiumBorder(),
              elevation: 20)));

  //###################################################################
}
//######################################################################