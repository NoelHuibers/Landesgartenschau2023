import 'package:flutter/material.dart';

class Darkmode extends StatefulWidget {
  const Darkmode({Key? key}) : super(key: key);

  @override
  State<Darkmode> createState() => _Darkmode();
}

class _Darkmode extends State<Darkmode> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Darkmode'),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
      secondary: const Icon(Icons.lightbulb_outline),
    );
  }
}
