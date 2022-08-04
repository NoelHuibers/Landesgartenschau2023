import 'package:flutter/material.dart';

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
