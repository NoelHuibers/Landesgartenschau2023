import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/config/insets.dart';
import 'package:landesgartenschau2023/pages/home/widgets/default_card.dart';
import 'settings/widgets/darkmode.dart';
import 'settings/widgets/impressum_button.dart';
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
        body: Padding(
            padding: const EdgeInsets.only(top: Insets.xxs),
            child: Column(
              children: const <Widget>[
                DefaultCard(child: Darkmode()),
                DefaultCard(child: Language()),
              ],
            )),
        bottomNavigationBar: const Padding(
            padding: EdgeInsets.only(bottom: Insets.m),
            child: Impressumbutton()));
  }
}
