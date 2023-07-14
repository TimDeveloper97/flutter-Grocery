import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:
            //0A1931  // white yellow 0xFFFCF8EC
            isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
        primaryColor: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: isDarkTheme
                  ? const Color(0xFF1a1f3c)
                  : const Color(0xFFE8FDFD),
              brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            ),
        cardColor:
            isDarkTheme ? const Color(0xFF0a0d2c) : const Color(0xFFF2FDFD),
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()),
        iconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
        textTheme: Theme.of(context).textTheme.copyWith(
              titleMedium:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              titleSmall:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              bodyMedium:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              bodySmall:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              labelSmall:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              labelMedium:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              labelLarge:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              displayMedium:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              displaySmall:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              headlineMedium:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              titleLarge:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
              bodyLarge:
                  TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
            ));
  }
}
