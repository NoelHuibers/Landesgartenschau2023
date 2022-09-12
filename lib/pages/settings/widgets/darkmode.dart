import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/services/provider/darkmode_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

/*
Die Datei ist für das Bilden
der Dropdownliste der Dark und Light mode 
in der Einstellungs-Page
*/

class Darkmode extends StatefulWidget {
  const Darkmode({Key? key}) : super(key: key);

  @override
  State<Darkmode> createState() => DarkmodeState();
}

class DarkmodeState extends State<Darkmode> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.light_mode_outlined,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        AppLocalizations.of(context)!.thememode,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      trailing: Consumer<ThemeProvider>(builder: (context, provider, child) {
        return SizedBox(
            width: 75,
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
              dropdownColor: Theme.of(context).colorScheme.surfaceTint,
              value: provider.currentTheme,
              items: [
                DropdownMenuItem<String>(
                  value: 'light',
                  child: Text(
                    'Light',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'dark',
                  child: Text(
                    'Dark',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'system',
                  child: Text(
                    'System',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
              onChanged: (String? value) {
                provider.changeTheme(value ?? 'system');
              },
            )));
      }),
    );
  }
}
