import 'package:flutter/material.dart';

Widget bottomBar() {
  return ButtonBar(
    alignment: MainAxisAlignment.center,
    children: <Widget>[
      RawMaterialButton(
        onPressed: () {},
        elevation: 2.0,
        fillColor: Colors.black54,
        padding: const EdgeInsets.all(15),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.home,
          size: 35,
        ),
      ),
      RawMaterialButton(
        onPressed: () {},
        elevation: 2.0,
        fillColor: Colors.black54,
        padding: const EdgeInsets.all(15),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.local_parking,
          size: 35,
        ),
      ),
      RawMaterialButton(
        onPressed: () {},
        elevation: 2.0,
        fillColor: Colors.black54,
        padding: const EdgeInsets.all(15),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.forest_outlined,
          size: 35,
        ),
      ),
      RawMaterialButton(
        onPressed: () {},
        elevation: 2.0,
        fillColor: Colors.black54,
        padding: const EdgeInsets.all(15),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.wc,
          size: 35,
        ),
      )
    ],
  );
}
