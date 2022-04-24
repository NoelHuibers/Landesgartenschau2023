import 'package:flutter/widgets.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('de'),
  ];

  static Image getFlag(String code) {
    switch (code) {
      case 'en':
        return Image.asset(
          "assets/images/english.png",
          width: 32,
          height: 32,
        );
      case 'de':
        return Image.asset(
          "assets/images/german.png",
          width: 32,
          height: 32,
        );
      default:
        return Image.asset(
          "assets/images/english.png",
          width: 32,
          height: 32,
        );
    }
  }
}
