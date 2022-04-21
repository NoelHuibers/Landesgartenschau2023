import 'package:flutter_localizations/flutter_localizations.dart';

import '/pages/home.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'models/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LGS2023',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      home: const Home(),
    );
  }
}
