import 'package:flutter/material.dart';

/*
Die Datei ist für das Bilden
der Card mit bestimmten Eigenschaften 
dies wird in mehreren Pages verwendet
*/

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    Key? key,
    required this.child,
    var color,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceTint,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Theme.of(context).colorScheme.surfaceTint,
          child: child),
    );
  }
}
