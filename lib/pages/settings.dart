import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/settings/widgets/app_info.dart';
import 'package:landesgartenschau2023/pages/user/user_tools.dart';
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
        leading: BackButton(color: Theme.of(context).colorScheme.onBackground),
        title: Text(
          'Settings Page',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: Insets.xxs),
          child: Column(
            children: <Widget>[
              const DefaultCard(child: Darkmode()),
              const DefaultCard(child: Language()),
              const DefaultCard(child: AppInfoButton()),
              const SizedBox(
                height: 308,
              ),
              const Impressumbutton(),
              buildText(
                  context,
                  '© Landesgartenschau Höxter 2023 GmbH \n                   Alle Rechte vorbehalten.',
                  10),
            ],
          )),
    );
  }
}
