import 'package:flutter/material.dart';

mixin Palette {
  static final ThemeData darkTheme = ThemeData(
    listTileTheme: const ListTileThemeData(textColor: Colors.white),
    cardColor: const Color.fromARGB(255, 28, 28, 28),
    scaffoldBackgroundColor: const Color.fromARGB(6, 179, 179, 179),
    appBarTheme: const AppBarTheme(
      // ignore: deprecated_member_use
      textTheme: TextTheme(
        subtitle2: TextStyle(color: Colors.white, fontSize: 15),
      ),
      color: Color(0xE6333333),
      titleTextStyle:
          TextStyle(color: Color.fromARGB(255, 234, 234, 234), fontSize: 25),
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 234, 234, 234),
      ),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xE6333333),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.resolveWith((state) => Colors.white))),
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
    textTheme: const TextTheme(
      headline5: TextStyle(
        color: Colors.white,
      ), // Überschrift (appbar)
      subtitle1: TextStyle(
        color: Color(0xE6333333),
      ), // Switch Labeltext
      subtitle2: TextStyle(
        color: Color(0xE6333333),
      ), // Sliding Panel
      labelMedium: TextStyle(
        color: Color(0xE6333333),
      ), // Sliding Panel
      bodyText1: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Haupttext2
      bodyText2: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      caption: TextStyle(
        color: Colors.white,
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    listTileTheme: const ListTileThemeData(textColor: Colors.black),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    cardColor: const Color.fromARGB(255, 255, 255, 255),
    appBarTheme: const AppBarTheme(
      // ignore: deprecated_member_use
      textTheme: TextTheme(
        subtitle2: TextStyle(color: Colors.black, fontSize: 15),
      ),
      color: Color.fromARGB(230, 199, 195, 195),
      titleTextStyle:
          TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 0, 0, 0), //AppBar Button
      ),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color.fromARGB(239, 213, 212, 212),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.resolveWith((state) => Colors.black))),
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
      ), // Überschrift (appbar)
      subtitle1: TextStyle(
        color: Colors.black,
      ), // Switch Labeltext
      subtitle2: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Sliding Panel
      labelMedium: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Sliding Panel
      bodyText1: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Haupttext2
      bodyText2: TextStyle(
        color: Color.fromARGB(230, 0, 0, 0),
      ),
      caption: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
