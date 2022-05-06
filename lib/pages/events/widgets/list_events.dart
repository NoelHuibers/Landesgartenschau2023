import 'package:flutter/material.dart';

List eventsList = [
  {
    "title": "1st January",
    "subtitle": "It's newyear! Time to wish Noel and team-mates!",
  },
  {
    "title": "Weserstufen",
    "subtitle": "Info of Weserstufen",
  },
  {
    "title": "Galeriegärten",
    "subtitle":
        "Info of Galeriegärten  nnbvcxjkvgjkxbhxjkhvxjk jhkdgrirzgöld fjdioghoöjhdiozue odhjöflmjnölkcnklnd diohguihj huezruizthwioezupw0ßu uotrzueüht8zjäo tjiozheprojpodfjioghdkhn jidohljmnklgdfmnjkvb n hvbxjklbncvjlkxvbxjkvbjbnkcx.bgfjh",
  },
];

class Eventslist extends StatelessWidget {
  const Eventslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lines = false;
    return SafeArea(
      child: ListView.builder(
        itemCount: eventsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(eventsList[index]['title']),
            subtitle: Text(eventsList[index]['subtitle'],
                maxLines: lines ? 2 : 10, overflow: TextOverflow.ellipsis),
            onTap: () {
              lines = !lines;
            },
          );
        },
      ),
    );
  }
}
