import 'package:flutter_localizations/flutter_localizations.dart';

import '/pages/home.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'models/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'services/provider/locale_provider.dart';
import 'services/provider/darkmode_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<LocaleProvider>(
              create: (_) => LocaleProvider(const Locale("en"))),
          ChangeNotifierProvider<ColorProvider>(create: (_) => ColorProvider()),
        ],
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          final provider2 = Provider.of<ColorProvider>(context);
          return MaterialApp(
            title: 'LGS2023',
            themeMode:
                ColorProvider.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            home: const Home(),
          );
        },
      );
}
