import 'package:flutter/material.dart';
import 'star.dart';

List standsList = [
  {
    "title": "Horizontbank",
    "subtitle": "Info of Horizontbank",
    "starred": true
  },
  {"title": "Weserstufen", "subtitle": "Info of Weserstufen", "starred": false},
  {
    "title": "Galeriegärten",
    "subtitle": "Info of Galeriegärten",
    "starred": false
  }
];

class Standslist extends StatelessWidget {
  const Standslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: standsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Star(starred: standsList[index]["starred"]),
            title: Text(standsList[index]['title']),
            subtitle: Text(standsList[index]['subtitle']),
            onTap: () {
              standsList[index]['starred'] = !standsList[index]['starred'];
            },
          );
        },
      ),
    );
  }
}
