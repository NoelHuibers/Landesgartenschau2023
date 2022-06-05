import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  const Star({Key? key, required starred}) : super(key: key);

  @override
  State<Star> createState() => _Star();
}

class _Star extends State<Star> {
  @override
  Widget build(BuildContext context) {
    bool starred = false; // NEEDS FIX
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
