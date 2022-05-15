import 'package:flutter/material.dart';

import '/config/insets.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({Key? key, required this.flex}) : super(key: key);
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: flex,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.m),
                color: Theme.of(context).colorScheme.primary),
            margin: const EdgeInsets.all(Insets.s)));
  }
}
