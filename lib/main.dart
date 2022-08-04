import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landesgartenschau2023/pages/home.dart';
import 'package:landesgartenschau2023/services/logic.dart';
import 'package:provider/provider.dart';
import 'models/l10n/l10n.dart';
import 'services/provider/locale_provider.dart';
import 'services/provider/darkmode_provider.dart';
import 'config/palette.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider()..initialize(),
      child: const MyApp(),
    ),
  );
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
          final BloC bloc = BloC();
          bloc.writeToDatabase();
          final languageProvider = Provider.of<LocaleProvider>(context);
          return Consumer<ThemeProvider>(builder: (context, provider, child) {
            return ScreenUtilInit(
                builder: ((context, child) => MaterialApp(
                      title: 'LGS2023',
                      theme: Palette.lightTheme,
                      darkTheme: Palette.darkTheme,
                      themeMode: provider.themeMode,
                      locale: languageProvider.locale,
                      supportedLocales: L10n.all,
                      localizationsDelegates: const [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate
                      ],
                      home: const Homepage(),
                    )),
                designSize: const Size(360, 690));
          });
        },
      );
}
