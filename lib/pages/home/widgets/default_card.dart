import 'package:flutter/material.dart';
import '/config/insets.dart';

class DefaultCard extends StatelessWidget {
  var color;

  DefaultCard({
    Key? key,
    required this.child,
    color,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.s),
        child:
            Card(color: Theme.of(context).colorScheme.primary, child: child));
  }
}
