import 'package:flutter/material.dart';

class Impressum extends StatelessWidget {
  const Impressum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14.0),
      child: const Text(
        'Impressum',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
