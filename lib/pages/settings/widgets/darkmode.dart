import 'package:flutter/material.dart';
import '/services/provider/darkmode_provider.dart';
import 'package:provider/provider.dart';

class Darkmode extends StatelessWidget {
  const Darkmode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ColorProvider>(context);
    return SwitchListTile(
      title: const Text('Darkmode'),
      value: ColorProvider.isDarkMode,
      onChanged: (bool value) {
        final provider = Provider.of<ColorProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
      secondary: const Icon(Icons.lightbulb_outline),
    );
  }
}
