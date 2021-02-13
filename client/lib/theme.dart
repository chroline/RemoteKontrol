import 'package:flutter/material.dart';

class AppTheme {
  final MaterialColor primarySwatch = Colors.indigo;
  final MaterialAccentColor accentSwatch = Colors.orangeAccent;
  ThemeData theme;

  AppTheme() {
    theme = ThemeData(
        primarySwatch: primarySwatch,
        accentColor: accentSwatch.shade200,
        //textTheme: GoogleFonts.interTextTheme(),
        buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0))));
  }
}
