import 'package:flutter/material.dart';

import 'default_card.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultCard(
        child: ListTile(
      title: Text('Serachbar'),
    ));
  }
}
