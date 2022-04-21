import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _Language();
}

class _Language extends State<Language> {
  Image languageImageGerman = Image.asset(
    "assets/images/german.png",
    width: 32,
    height: 32,
  );
  Image languageImageEnglish = Image.asset(
    "assets/images/english.png",
    width: 32,
    height: 32,
  );
  bool english = true;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.language),
        title: Text(AppLocalizations.of(context)!.language),
        trailing: Container(
            margin: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              icon: (english == true)
                  ? languageImageEnglish
                  : languageImageGerman,
              onPressed: () {
                setState(() {
                  english = !english;
                });
              },
            )));
  }
}
