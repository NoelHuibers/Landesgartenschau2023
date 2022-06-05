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
          Icon star = Icon(standsList[index]["starred"] == true
              ? Icons.star
              : Icons.star_border);
          return ListTile(
            leading: IconButton(
                icon: star,
                onPressed: () {
                  standsList[index]['starred'] = !standsList[index]['starred'];
                  // setState(() {
                  //   star = (standsList[index]['starred']);
                  // });
                }),
            title: Text(standsList[index]['title']),
            subtitle: Text(standsList[index]['subtitle']),
            onTap: () {},
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
