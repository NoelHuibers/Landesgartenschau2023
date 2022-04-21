import 'package:flutter/material.dart';
import '/config/insets.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({Key? key, required this.color, required this.flex})
      : super(key: key);
  final Color color;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: flex,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.m), color: color),
            margin: const EdgeInsets.all(Insets.s)));
  }
}
