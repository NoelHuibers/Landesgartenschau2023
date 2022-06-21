import 'package:flutter/material.dart';
import '/config/insets.dart';
import '/pages/home/widgets/default_card.dart';
import 'settings/widgets/darkmode.dart';
import 'settings/widgets/impressum_button.dart';
import 'settings/widgets/language.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          leading:
              BackButton(color: Theme.of(context).colorScheme.onBackground),
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
        bottomNavigationBar: const SizedBox(
            width: 20,
            child: Padding(
                padding: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 30),
                child: Impressumbutton())));
  }
}
