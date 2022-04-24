import 'package:flutter/material.dart';
import 'home/widgets/round_container.dart';
import 'login.dart';
import 'settings.dart';
import '/config/palette.dart';
import '/pages/events.dart';
import 'map.dart';
import 'package:landesgartenschau2023/config/insets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.account_circle_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
          title: const Center(child: Text("Landesgartenschau 2023")),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            )
          ],
          actionsIconTheme: const IconThemeData(size: 32),
        ),
        body: Column(children: [
          Flexible(
              child: Row(children: [
            Flexible(
                child: InkWell(
              child:
                  const RoundContainer(color: Palette.secondaryDark, flex: 1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Veranstaltungen()),
                );
              },
            )),
            Flexible(
                child: InkWell(
              child: const RoundContainer(color: Palette.primary, flex: 1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Veranstaltungen()), //Veranstalltung Doppelt!!! mit zukünftige Page erstezen
                );
              },
            )),
          ])),
          Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Insets.m),
                    color: Palette.primary),
                margin: const EdgeInsets.all(Insets.m),
                child: smallMap(),
              )),
        ]));
  }
}
