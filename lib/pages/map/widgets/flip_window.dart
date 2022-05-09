import 'package:flutter/material.dart';
import '../../../config/palette.dart';

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
        return Container(
          child: Center(
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
                          color: Palette.primary),
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
                          color: Palette.primary),
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
                          color: Palette.primary),
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
                          color: Palette.primary),
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
          )),
        );
      });
}

Future<String?> eingabe_text(BuildContext context) {
  TextEditingController controller = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Startadresse"),
          content: TextField(
            decoration:
                const InputDecoration(hintText: "Startadresse eingeben"),
            autofocus: true,
            controller: controller,
          ),
          actions: [
            MaterialButton(
              elevation: 5.0,
              child: Text("eigeben"),
              onPressed: () {
                Navigator.of(context).pop(controller.text.toString());
              },
            )
          ],
        );
      });
}
