import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
import '/models/l10n/l10n.dart';
import '/services/provider/locale_provider.dart';

/*
Die Datei ist für das Bildem der Sprachauswahl, 
die in der Setting Page zufinden ist
*/

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _Language();
}

class _Language extends State<Language> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;

    return ListTile(
        leading: Icon(
          Icons.language,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        title: Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        trailing: Container(
            margin: const EdgeInsets.only(right: 6.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  dropdownColor: Theme.of(context).colorScheme.surfaceTint,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  value: locale,
                  items: L10n.all.map(
                    (locale) {
                      final displayflag = L10n.getFlag(locale.languageCode);
                      return DropdownMenuItem(
                        value: locale,
                        onTap: () {
                          final provider = Provider.of<LocaleProvider>(context,
                              listen: false);
                          provider.setLocale(locale);
                        },
                        child: displayflag,
                      );
                    },
                  ).toList(),
                  onChanged: (_) {}),
            )));
  }
}
