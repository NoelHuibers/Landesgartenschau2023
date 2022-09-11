import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

/*
Die Datei ist für das Bilden
des Dialogs in der Einstellungs-Page 
und dies dient dazu allgemeine Informationen über 
die App zu zeigen
*/
class AppInfoButton extends StatelessWidget {
  const AppInfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          Icons.info_outline,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        title: Text(
          AppLocalizations.of(context)!.informationabouttheapplication,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        onTap: () {
          showAboutDialog(
            context: context,
            applicationIcon: const FlutterLogo(),
            applicationLegalese: 'Legalese',
            applicationName: 'LGS Höxter',
            applicationVersion: 'version 1.0.0',
          );
        });
  }
}
