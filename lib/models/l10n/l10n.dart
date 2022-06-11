import 'package:flutter/widgets.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('de'),
    const Locale('es')
  ];

  static Image getFlag(String code) {
    switch (code) {
      case 'en':
        return Image.asset("assets/images/english.png", width: 32, height: 32);
      case 'de':
        return Image.asset("assets/images/german.png", width: 32, height: 32);
      case 'es':
        return Image.asset("assets/images/spanish.png", width: 32, height: 32);
      default:
        return Image.asset("assets/images/english.png", width: 32, height: 32);
    }
  }
}
