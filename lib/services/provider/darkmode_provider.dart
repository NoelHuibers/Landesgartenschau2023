import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MyThemes {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.grey.shade500, // round container
      onPrimary: Colors.blue, // unbenutzt
      secondary: Colors.black54, // Buttons
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
        color: Colors.white70,
        //fontSize: 18.0,
      ), // Switch Labeltext
      labelMedium: TextStyle(
        color: Colors.white,
        //fontSize: 16.0,
      ), // ?
      bodyText2: TextStyle(
        color: Colors.white,
        //fontSize: 14.0,
      ), // Haupttext
    ),
    primaryColor: Colors.grey, // unbenutzt
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.green,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.yellow.shade800, // round container
      onPrimary: Colors.white, // unbenutzt
      secondary: Colors.green, // Buttons
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
      ), // ?
      bodyText1: TextStyle(
        color: Colors.black,
        //fontSize: 14.0,
      ), // Haupttext
    ),
    primaryColor: Colors.yellow.shade800, // unbenutzt
  );
}

class ColorProvider extends ChangeNotifier {
  static ThemeMode themeMode = ThemeMode.system;

  static bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
