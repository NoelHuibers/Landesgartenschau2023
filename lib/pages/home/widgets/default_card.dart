import 'package:flutter/material.dart';

import '/config/insets.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    Key? key,
    required this.child,
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
