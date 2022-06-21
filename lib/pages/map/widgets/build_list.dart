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
    return Container(
        color: Theme.of(context).colorScheme.primary,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 70,
              child: buildSearch(),
            ),
            SizedBox(
              child: buildTextButton("Stands", const Stands()),
            ),
            SizedBox(
                height: 200,
                child: DefaultCard(
                  child: ListView.builder(
                    itemCount: stands.length,
                    itemBuilder: (context, index) {
                      final stand = stands[index];
                      return buildList(stand);
                    },
                  ),
                )),
            SizedBox(
              child: buildTextButton("Events", const Events()),
            ),
            SizedBox(
                height: 200,
                child: DefaultCard(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return buildList(event);
                    },
                  ),
                )),
          ],
        ));
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
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ),
        MaterialButton(
            color: Theme.of(context).colorScheme.surfaceTint,
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => routing));
            },
            child: Icon(
              Icons.view_list_rounded,
              color: Theme.of(context).colorScheme.onBackground,
            )),
      ],
    );
  }

  Widget buildList(liste) => ListTile(
        textColor: Theme.of(context).colorScheme.onBackground,
        tileColor: Theme.of(context).colorScheme.surfaceTint,
        title: Text(
          liste.titel,
        ),
        subtitle: Text(
          liste.subtitle,
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Suchen sie in Listen',
        onChanged: search,
      );

  void search(String query) {
    final stands = allstands.where((stand) {
      final titleLower = stand.titel.toLowerCase();
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
