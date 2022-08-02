import 'package:flutter/material.dart';

mixin Palette {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(6, 179, 179, 179),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(6, 94, 4, 4),
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 28, 28, 28),
      ),
    ),

    primarySwatch: Colors.red,

    colorScheme: const ColorScheme.dark(
        primary: Color.fromARGB(255, 28, 28, 28), // dark=grau - light=grau
        onPrimary: Color(0xFFF6FDFF), // dark=weiß - light=grau
        tertiary: Color.fromARGB(255, 25, 105, 243),
        surfaceVariant: Color(0xE6333333),
        surfaceTint: Color(0xE6333333) // locationmarker
        ),

    iconTheme: const IconThemeData(
      color: Color(0xFFF6FDFF),
    ),
    // Link Text Color: 1E77B7

    textTheme: const TextTheme(
      headline5: TextStyle(
        color: Colors.white,
        //fontSize: 20.0,
      ), // Überschrift (appbar)
      subtitle1: TextStyle(
        color: Color(0xE6333333),
        //fontSize: 18.0,
      ), // Switch Labeltext
      subtitle2: TextStyle(
        color: Color(0xE6333333),
        //fontSize: 18.0,
      ), // Sliding Panel
      labelMedium: TextStyle(
        color: Color(0xE6333333),
        //fontSize: 16.0,
      ), // Sliding Panel
      bodyText1: TextStyle(
        color: Color(0xFFF6FDFF),
        //fontSize: 14.0,
      ), // Haupttext2
      bodyText2: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        //fontSize: 14.0,
      ), // Haupttext1
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(197, 187, 187, 187),
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    ),
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 255, 255, 255), // dark=grau - light=grau
      onPrimary: Color(0xE6333333), // dark=weiß - light=grau
      tertiary: Color.fromARGB(255, 25, 105, 243),
      surfaceVariant: Color(0xFFF6FDFF),
      surfaceTint: Color.fromARGB(230, 199, 195, 195), // locationmarker
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFF6FDFF),
    ),
    textTheme: const TextTheme(
      headline5: TextStyle(
        color: Colors.black,
        //fontSize: 20.0,
      ), // Überschrift (appbar)
      subtitle1: TextStyle(
        color: Colors.black,
        //fontSize: 18.0,
      ), // Switch Labeltext
      subtitle2: TextStyle(
        color: Color(0xFFF6FDFF),
        //fontSize: 18.0,
      ), // Sliding Panel
      labelMedium: TextStyle(
        color: Color(0xFFF6FDFF),
        //fontSize: 16.0,
      ), // Sliding Panel
      bodyText1: TextStyle(
        color: Color(0xFFF6FDFF),
        //fontSize: 14.0,
      ), // Haupttext2
      bodyText2: TextStyle(
        color: Color.fromARGB(230, 0, 0, 0),
        //fontSize: 14.0,
      ), // Haupttext
    ),
  );
}
