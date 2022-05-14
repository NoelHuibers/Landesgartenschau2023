import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/config/palette.dart';
import '/config/insets.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    Key? key,
    required this.view,
  }) : super(key: key);
  final Widget view;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.s),
        child: Card(color: Colors.grey.shade600, child: view));
  }
}
