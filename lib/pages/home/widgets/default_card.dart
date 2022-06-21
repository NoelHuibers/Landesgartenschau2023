import 'package:flutter/material.dart';
import '/config/insets.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    Key? key,
    required this.child,
    var color,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.s),
        child: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: Theme.of(context).colorScheme.surfaceTint,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Theme.of(context).colorScheme.surfaceTint,
                  child: child),
            )));
  }
}
