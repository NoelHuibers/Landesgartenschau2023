import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/config/insets.dart';
import 'package:landesgartenschau2023/pages/user/user_tools.dart';
import 'impressum/view_impressum.dart';
import '/pages/home/widgets/default_card.dart';

class Impressum extends StatelessWidget {
  const Impressum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        leading: BackButton(color: Theme.of(context).colorScheme.onBackground),
        title: Text(
          'Impressum',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: Insets.xxs),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              buildText(context, 'Impressum gemäß § 5 TMG / § 55 RStV', 15),
              const SizedBox(
                height: 10,
              ),
              const DefaultCard(child: Impressumview()),
              const SizedBox(
                height: 20,
              ),
              buildText(
                  context,
                  '© Landesgartenschau Höxter 2023 GmbH \n                   Alle Rechte vorbehalten.',
                  10),
            ],
          )),
    );
  }
}
