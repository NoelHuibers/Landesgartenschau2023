import 'package:flutter/material.dart';
import 'login.dart';
import 'settings.dart';
import '/config/palette.dart';
import '/config/insets.dart';

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
          title: const Center(child: Text("Landesgartenschau 2022")),
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
              flex: 2,
              child: Row(children: [
                Flexible(
                    flex: 1,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue),
                        margin: const EdgeInsets.all(20.0))),
                Flexible(
                    flex: 1,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.cyan),
                        margin: const EdgeInsets.all(20.0)))
              ])),
          Flexible(
              flex: 3,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Insets.m),
                      color: Palette.primary),
                  margin: const EdgeInsets.all(Insets.m)))
        ]));
  }
}
