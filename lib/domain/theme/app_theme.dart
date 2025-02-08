import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white,
      headerBackgroundColor: Colors.white,
      dayBackgroundColor: WidgetStateProperty.all(Colors.orange),
      rangePickerBackgroundColor: Colors.orange[100],
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
