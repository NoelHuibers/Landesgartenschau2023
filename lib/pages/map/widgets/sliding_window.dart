import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/map/widgets/build_list.dart';
import '../../home/button_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class slide_page extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  const slide_page({
    Key? key,
    required this.controller,
    required this.panelController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: <Widget>[
        SizedBox(height: 20, child: swipe_bottum()),
        SizedBox(height: 80, child: bottom_bar()),
        SizedBox(
          height: 500,
          child: buildList(),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget swipe_bottum() => GestureDetector(
        onTap: slide_page_controll,
        child: Center(
          child: Container(
            width: 70,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );

  // ignore: non_constant_identifier_names
  void slide_page_controll() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();
}
