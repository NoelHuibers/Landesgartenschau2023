import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  const Star({Key? key, required this.starred}) : super(key: key);
  final bool starred;

  @override
  State<Star> createState() => _Star();
}

class _Star extends State<Star> {
  @override
  Widget build(BuildContext context) {
    return Icon(widget.starred == true ? Icons.star : Icons.star_border);
  }
}
