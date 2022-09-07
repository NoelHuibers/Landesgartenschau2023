import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
In der Datei befinden sich die beiden Provider classen 
die für das Dark und Light mode verwendet werden 
*/
class ColorProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.light;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class ThemeProvider extends ChangeNotifier {
  String currentTheme = 'system';

  ///Liefert themeMode
  ThemeMode get themeMode {
    if (currentTheme == 'light') {
      return ThemeMode.light;
    } else if (currentTheme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  ///dient dazu das ausgewählte Thema aus Einstellungen
  ///in SharedPreferences zu speichern
  ///[theme]
  changeTheme(String theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
    currentTheme = theme;
    notifyListeners();
  }

  ///dient dazu das ausgewählte Thema aus Einstellungen
  ///aus SharedPreferences zu lesen
  ///als currentTheme festlegen
  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    currentTheme = prefs.getString('theme') ?? 'system';
    notifyListeners();
  }
}
