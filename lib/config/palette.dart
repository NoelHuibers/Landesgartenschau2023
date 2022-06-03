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
      primary: Color(0xE6333333), // dark=grau - light=grau
      onPrimary: Color(0xFFF6FDFF), // dark=weiß - light=grau
      secondary: Color(0xE6333333), // dark=grau - light=weiß
      onSecondary: Color(0xFFF6FDFF), // dark=weiß - light=weiß
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
      onPrimary: Color(0xE6333333), //
      secondary: Color(0xFFF6FDFF), // Buttons
      onSecondary: Color(0xFFF6FDFF), //
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
