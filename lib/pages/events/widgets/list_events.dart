import 'package:flutter/material.dart';

List eventsList = [
  {
    "title": "1st January",
    "subtitle": "It's newyear! Time to wish Noel and team-mates!",
  },
  {
    "title": "Cool Event",
    "subtitle": "Short Text",
  },
  {
    "title": "Long Text",
    "subtitle":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
                maxLines: lines ? 10 : 2, overflow: TextOverflow.ellipsis),
            onTap: () {
              lines = !lines;
            },
          );
        },
      ),
    );
  }
}
