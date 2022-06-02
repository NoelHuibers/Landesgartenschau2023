import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/services/provider/darkmode_provider.dart';

class Darkmode extends StatelessWidget {
  const Darkmode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        'Darkmode',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      value: Provider.of<ColorProvider>(context).isDarkMode,
      onChanged: (bool value) {
        final provider = Provider.of<ColorProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
      secondary: Icon(
        Icons.lightbulb_outline,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
