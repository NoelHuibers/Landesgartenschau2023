import 'package:flutter/material.dart';
import '/models/stands_model.dart';
import 'star.dart';

class Standslist extends StatelessWidget {
  const Standslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: StandsModel.standsList.length,
        itemBuilder: (context, index) {
          Widget _star = Star(starred: standsList[index]["starred"]);
          return ListTile(
            leading: _star,
            title: Text(standsList[index]['title']),
            subtitle: Text(standsList[index]['subtitle']),
            onTap: () {
              standsList[index]['starred'] = !standsList[index]['starred'];
              setState() {
                _star = Star(starred: standsList[index]["starred"]);
              }
            },
          );
        },
      ),
    );
  }
}

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
