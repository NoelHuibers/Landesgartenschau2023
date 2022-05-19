import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/models/events_Stand_model.dart';
import 'package:landesgartenschau2023/models/events_Stand_Data.dart';

import '../../home/widgets/searchbar.dart';

class buildList extends StatefulWidget {
  @override
  buildListState createState() => buildListState();
}

class buildListState extends State<buildList> {
  String query = '';
  late List<StandsList> stands;
  late List<EventsList> events;

  @override
  void initState() {
    super.initState();
    stands = allstands;
    events = allevents;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: 70,
          child: buildSearch(),
        ),
        SizedBox(
          child: Container(
            height: 30,
            alignment: Alignment(-0.89, 0),
            child: const Text(
              "Stands",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
        ),
        SizedBox(
            height: 200,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.red,
              child: ListView.builder(
                itemCount: stands.length,
                itemBuilder: (context, index) {
                  final stand = stands[index];
                  return buildStand(stand);
                },
              ),
            )),
        SizedBox(
          child: Container(
            height: 40,
            alignment: const Alignment(-0.89, 0),
            child: const Text(
              "Events",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
        ),
        SizedBox(
            height: 200,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.blue,
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return buildEvents(event);
                },
              ),
            )),
      ],
    );
  }

  Widget buildStand(StandsList stand) => ListTile(
        title: Text(stand.title),
        subtitle: Text(stand.subtitle),
      );

  Widget buildEvents(EventsList event) => ListTile(
        title: Text(event.titel),
        subtitle: Text(event.subtitle),
      );

  // Widget buildList() => FilterStand();

  // Widget buildEvent() => FilterEvent();

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Suchen sie in Listen',
        onChanged: search,
      );

  void search(String query) {
    final stands = allstands.where((stand) {
      final titleLower = stand.title.toLowerCase();
      final subtitelLower = stand.subtitle.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          subtitelLower.contains(searchLower);
    }).toList();

    final events = allevents.where((event) {
      final titleLower = event.titel.toLowerCase();
      final authorLower = event.subtitle.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.stands = stands;
      this.events = events;
    });
  }
}
