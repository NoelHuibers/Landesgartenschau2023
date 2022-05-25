import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/map.dart';
import 'package:landesgartenschau2023/pages/settings.dart';
import 'package:landesgartenschau2023/pages/user/login_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:landesgartenschau2023/pages/map/widgets/sliding_window.dart';

class Home_page extends StatefulWidget {
  @override
  Home_pageState createState() => Home_pageState();
}

class Home_pageState extends State<Home_page> {
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.account_circle_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
          title: const Center(child: Text("Landesgartenschau 2022")),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert_rounded),
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
        body: SlidingUpPanel(
          controller: panelController,
          minHeight: 25,
          maxHeight: 600,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          parallaxEnabled: true,
          parallaxOffset: .5,
          body: bigMap(),
          panelBuilder: (controller) => slide_page(
            controller: controller,
            panelController: panelController,
          ),
        ));
  }
}
