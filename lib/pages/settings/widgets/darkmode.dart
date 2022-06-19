import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/services/provider/darkmode_provider.dart';

class Darkmode extends StatefulWidget {
  const Darkmode({Key? key}) : super(key: key);

  @override
  State<Darkmode> createState() => DarkmodeState();
}

class DarkmodeState extends State<Darkmode> {
  late bool select = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          Provider.of<ColorProvider>(context).isDarkMode
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        title: Text(
          Provider.of<ColorProvider>(context).isDarkMode
              ? 'Lightmode'
              : 'Darkmode',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        trailing: Container(
            width: 32,
            margin: const EdgeInsets.only(right: 25.0),
            child: SwitchListTile(
              value: Provider.of<ColorProvider>(context).isDarkMode,
              onChanged: (bool value) {
                final provider =
                    Provider.of<ColorProvider>(context, listen: false);
                provider.toggleTheme(value);
              },
            )));
  }
}
