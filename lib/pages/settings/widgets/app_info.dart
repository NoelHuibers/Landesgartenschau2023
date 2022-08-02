import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../services/provider/darkmode_provider.dart';

class AppInfoButton extends StatelessWidget {
  const AppInfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          Provider.of<ColorProvider>(context).isDarkMode
              ? Icons.info_outline
              : Icons.info,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        title: Text(
          'Informationen zur Applikation',
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
