import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/map/widgets/build_list.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidePage extends StatefulWidget {
  final PanelController panelController;

  const SlidePage({
    Key? key,
    required this.panelController,
  }) : super(key: key);
  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        physics:
            const NeverScrollableScrollPhysics(), //Exception vermeinden (Bei öffnung die App direkt swipen)
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 21,
                    child: swipe_bottum(),
                  ),
                  SizedBox(height: 80, child: bildButtonBar(context)),
                  const SizedBox(
                    height: 500,
                    child: BuildList(),
                  ),
                ],
              ))
        ]);
  }

  // ignore: non_constant_identifier_names
  Widget swipe_bottum() => GestureDetector(
        onTap: slide_page_controll,
        child: Center(
          child: Container(
            width: 70,
            height: 8,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );

  // ignore: non_constant_identifier_names
  void slide_page_controll() {
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      //Wenn Keyboard ist offen
      return;
    } else {
      widget.panelController.isPanelOpen
          ? widget.panelController.close()
          : widget.panelController.open();
    }
  }

  Widget bildButtonBar(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
        height: queryData.size.height,
        width: queryData.size.width,
        color: Theme.of(context).colorScheme.primary,
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonPadding: const EdgeInsets.symmetric(horizontal: 1),
          children: [
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Theme.of(context).colorScheme.surfaceTint,
              padding: const EdgeInsets.all(15),
              shape: const CircleBorder(),
              child: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.onBackground,
                size: 35,
              ),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Theme.of(context).colorScheme.surfaceTint,
              padding: const EdgeInsets.all(15),
              shape: const CircleBorder(),
              child: Icon(
                Icons.local_parking,
                color: Theme.of(context).colorScheme.onBackground,
                size: 35,
              ),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Theme.of(context).colorScheme.surfaceTint,
              padding: const EdgeInsets.all(15),
              shape: const CircleBorder(),
              child: Icon(
                Icons.forest_outlined,
                color: Theme.of(context).colorScheme.onBackground,
                size: 35,
              ),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Theme.of(context).colorScheme.surfaceTint,
              padding: const EdgeInsets.all(15),
              shape: const CircleBorder(),
              child: Icon(
                Icons.wc,
                size: 35,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            )
          ],
        ));
  }
}
