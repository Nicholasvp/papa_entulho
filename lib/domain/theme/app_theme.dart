import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black87,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
      labelSmall: TextStyle(color: Colors.white),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.black,
      headerBackgroundColor: Colors.black,
      dayBackgroundColor: WidgetStateProperty.all(Colors.orange),
      rangePickerBackgroundColor: Colors.orange[100],
      dayStyle: const TextStyle(color: Colors.black),
      rangePickerHeaderHeadlineStyle: const TextStyle(color: Colors.black),
      rangePickerHeaderHelpStyle: const TextStyle(color: Colors.black),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black),
        floatingLabelStyle: TextStyle(color: Colors.black),
        helperStyle: TextStyle(color: Colors.red),
        fillColor: Colors.red,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.orange,
    ),
    drawerTheme: const DrawerThemeData(
      elevation: 0,
      scrimColor: Colors.black54,
      surfaceTintColor: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
