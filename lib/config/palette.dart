import 'package:flutter/material.dart';

mixin Palette {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(20, 20, 20, 1),
    appBarTheme: const AppBarTheme(
      color: Color.fromRGBO(47, 47, 47, 1),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    colorScheme: const ColorScheme.dark(
      primary: Color.fromRGBO(44, 44, 44, 1), // round container
      onPrimary: Colors.white, // Icons
      secondary: Color.fromRGBO(34, 201, 92, 1), // Buttons
      tertiary: Color.fromARGB(255, 25, 105, 243), // locationmarker
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    // Link Text Color: 1E77B7

    textTheme: const TextTheme(
      headline5: TextStyle(
        color: Colors.white,
        //fontSize: 20.0,
      ), // Überschrift (appbar)
      subtitle1: TextStyle(
        color: Colors.white70,
        //fontSize: 18.0,
      ), // Switch Labeltext
      labelMedium: TextStyle(
        color: Colors.white,
        //fontSize: 16.0,
      ), // unbenutzt
      bodyText1: TextStyle(
        color: Colors.white,
        //fontSize: 14.0,
      ), // Haupttext2
      bodyText2: TextStyle(
        color: Colors.white,
        //fontSize: 14.0,
      ), // Haupttext1
    ),
    primaryColor: Colors.black, // unbenutzt
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF6FDFF),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFF6FDFF),
      iconTheme: IconThemeData(
        color: Color.fromRGBO(246, 253, 255, 1),
      ),
    ),

    colorScheme: const ColorScheme.light(
      primary: Color(0xE6333333), // round container & default card & Icons
      onPrimary: Colors.black, // Icons (alt)
      secondary: Color(0xFFF6FDFF), // Buttons
      tertiary: Color.fromARGB(255, 25, 105, 243), // locationmarker
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    textTheme: const TextTheme(
      headline5: TextStyle(
        color: Color.fromRGBO(18, 19, 19, 1),
        //fontSize: 20.0,
      ), // Überschrift (appbar)
      subtitle1: TextStyle(
        color: Colors.black,
        //fontSize: 18.0,
      ), // Switch Labeltext
      labelMedium: TextStyle(
        color: Colors.white,
        //fontSize: 16.0,
      ), // unbenutzt
      bodyText1: TextStyle(
        color: Colors.white,
        //fontSize: 14.0,
      ), // Haupttext2
      bodyText2: TextStyle(
        color: Colors.black,
        //fontSize: 14.0,
      ), // Haupttext
    ),
    primaryColor: Colors.white, // unbenutzt
  );
}
