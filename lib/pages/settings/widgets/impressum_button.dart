import 'package:flutter/material.dart';

import '/pages/impressum.dart';

class Impressumbutton extends StatelessWidget {
  const Impressumbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Impressum()),
        );
      },
      child: Text(
        "Impressum",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
