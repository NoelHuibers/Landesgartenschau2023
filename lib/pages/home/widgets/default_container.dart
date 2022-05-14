import 'package:flutter/material.dart';
import '/config/insets.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer(
      {Key? key,
      required this.before,
      required this.title,
      required this.trailing})
      : super(key: key);
  final Image before;
  final String title;
  final Image trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Insets.m),
            color: Theme.of(context).colorScheme.primary),
        margin: const EdgeInsets.all(Insets.s));
  }
}
