import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  const Star({Key? key, required this.starred}) : super(key: key);
  final bool starred;

  @override
  State<Star> createState() => _Star();
}

class _Star extends State<Star> {
  bool starred = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(starred == true ? Icons.star : Icons.star_border),
        onPressed: () {
          // standsList[index]['starred'] = !standsList[index]['starred']; NEEDS FIX
          setState(() {
            //starred = (standsList[index]['starred']); // NEEDS FIX
          });
        });
  }
}
