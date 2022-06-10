import 'package:flutter/material.dart';
import '/models/stands_model.dart';

class Standslist extends StatefulWidget {
  const Standslist({Key? key}) : super(key: key);

  @override
  State<Standslist> createState() => StandslistState();
}

class StandslistState extends State<Standslist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: StandsModel.standsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: IconButton(
                icon: standsList[index]['starred'] == "false"
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border),
                onPressed: () {
                  // standsList[index]['starred'] = !standsList[index]['starred'];
                  setState(() {
                    if (standsList[index]['starred'] == "true") {
                      standsList[index]['starred'] = "false";
                    } else {
                      standsList[index]['starred'] = "true";
                    }
                  });
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
    "starred": "true"
  },
  {
    "title": "Weserstufen",
    "subtitle": "Info of Weserstufen",
    "starred": "true"
  },
  {
    "title": "Galeriegärten",
    "subtitle": "Info of Galeriegärten",
    "starred": "true"
  }
];
