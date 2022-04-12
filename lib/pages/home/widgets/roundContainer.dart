import 'package:flutter/material.dart';
import 'package:test/config/insets.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.m), color: color),
            margin: const EdgeInsets.all(Insets.s)));
  }
}
