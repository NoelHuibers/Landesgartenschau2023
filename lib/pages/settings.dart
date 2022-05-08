import 'package:flutter/material.dart';
import 'settings/widgets/darkmode.dart';
import 'settings/widgets/impressum.dart';
import 'settings/widgets/language.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings Page',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Column(
        children: const <Widget>[
          Language(),
          Darkmode(),
          Expanded(child: ListTile(title: Text(''))),
          Align(alignment: Alignment.bottomCenter, child: Impressum()),
        ],
      ),
    );
  }
}
