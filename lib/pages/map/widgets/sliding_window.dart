import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/map/widgets/build_list.dart';
import '../../home/button_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidePage extends StatefulWidget {
  final ScrollController controller;
  final PanelController panelController;

  SlidePage({
    Key? key,
    required this.controller,
    required this.panelController,
  }) : super(key: key);
  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: widget.controller,
      children: <Widget>[
        SizedBox(height: 20, child: swipe_bottum()),
        SizedBox(height: 80, child: buttonBar()),
        const SizedBox(
          height: 500,
          child: BuildList(),
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
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );

  // ignore: non_constant_identifier_names
  void slide_page_controll() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();
}
