import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/map/widgets/build_list.dart';
import '../../../config/palette.dart';
import '../../home/Button_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void flipFenster(context) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
          bottom: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext bc) {
        return Center(
            child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(15),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1.09,
          children: <Widget>[
            InkWell(
                onTap: () {
                  eingabe_text(context).then((onValue) {
                    print(onValue);
                    //Hier kann man die adresse an Backend senden
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.home,
                            size: 50,
                            color: Colors.red,
                          ),
                          Text(
                            "Bring mich zurück",
                            style: TextStyle(color: Colors.white),
                          )
                        ]))),
            InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.local_parking,
                            size: 50,
                            color: Colors.red,
                          ),
                          Text(
                            "Parkplatz finden",
                            style: TextStyle(color: Colors.white),
                          )
                        ]))),
            InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.forest_outlined,
                            size: 50,
                            color: Colors.red,
                          ),
                          Text(
                            "Stände",
                            style: TextStyle(color: Colors.white),
                          )
                        ]))),
            InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.wc,
                            size: 50,
                            color: Colors.red,
                          ),
                          Text(
                            "WC finden",
                            style: TextStyle(color: Colors.white),
                          )
                        ]))),
          ],
        ));
      });
}

Future<String?> eingabe_text(BuildContext context) {
  TextEditingController controller = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Startadresse"),
          content: TextField(
            decoration:
                const InputDecoration(hintText: "Startadresse eingeben"),
            autofocus: true,
            controller: controller,
          ),
          actions: [
            MaterialButton(
              elevation: 5.0,
              child: const Text("eigeben"),
              onPressed: () {
                Navigator.of(context).pop(controller.text.toString());
              },
            )
          ],
        );
      });
}

class slide_page2 extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  const slide_page2({
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
        const SizedBox(height: 80, child: bottom_bar()),
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
