import 'package:flutter/material.dart';

class Palette {
  static const Color primary = Color(0xFF00C569);
  static const Color primaryDark = Color(0xFF00B058);
  static const Color secondary = Color(0xFFFFC107);
  static const Color secondaryDark = Color(0xFFFFB300);
  static const Color locationMarker = Color.fromARGB(255, 25, 105, 243);
}

class MyThemes {
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
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.green.shade700,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),

    colorScheme: ColorScheme.light(
      primary: Colors.yellow.shade800, // round container
      onPrimary: Colors.black, // Icons
      secondary: Colors.green.shade700, // Buttons
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    textTheme: const TextTheme(
      headline5: TextStyle(
        color: Colors.white,
        //fontSize: 20.0,
      ), // Überschrift (appbar)
      subtitle1: TextStyle(
        color: Colors.black,
        //fontSize: 18.0,
      ), // Switch Labeltext
      labelMedium: TextStyle(
        color: Colors.black,
        //fontSize: 16.0,
      ), // unbenutzt
      bodyText1: TextStyle(
        color: Colors.black,
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
