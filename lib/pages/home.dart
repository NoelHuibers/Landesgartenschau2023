import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/map.dart';
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
