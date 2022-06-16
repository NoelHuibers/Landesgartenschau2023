import 'package:flutter/material.dart';
import '../../home/widgets/default_card.dart';
import 'package:landesgartenschau2023/models/events_stand_model.dart';
import 'package:landesgartenschau2023/models/events_stand_data.dart';
import '../../home/widgets/searchbar.dart';
import '../../events.dart';
import '../../stands.dart';

class BuildList extends StatefulWidget {
  const BuildList({Key? key}) : super(key: key);

  @override
  State<BuildList> createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
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
          child: buildTextButton("Stands", const Stands()),
          //Hier kommt die KLasse die abgerufen werden soll beim klicken ),
        ),
        SizedBox(
            height: 200,
            child: DefaultCard(
              color: Theme.of(context).colorScheme.onPrimary,
              child: ListView.builder(
                itemCount: stands.length,
                itemBuilder: (context, index) {
                  final stand = stands[index];
                  return buildStand(stand);
                },
              ),
            )),
        SizedBox(
          child: buildTextButton("Events",
              const Events()), //Hier kommt die KLasse die abgerufen werden soll beim klicken  ),
        ),
        SizedBox(
            height: 200,
            child: DefaultCard(
              color: Theme.of(context).colorScheme.onPrimary,
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

  Widget buildTextButton(String text, Widget routing) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30,
            alignment: const Alignment(-0.89, 0),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        MaterialButton(
            color: Theme.of(context).colorScheme.onPrimary,
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => routing));
            },
            child: Icon(
              Icons.view_list_rounded,
              color: Theme.of(context).colorScheme.secondary,
            )),
      ],
    );
  }

  Widget buildStand(StandsList stand) => ListTile(
        tileColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          stand.title,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        subtitle: Text(
          stand.subtitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      );

  Widget buildEvents(EventsList event) => ListTile(
        tileColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          event.titel,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        subtitle: Text(
          event.subtitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      );

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
