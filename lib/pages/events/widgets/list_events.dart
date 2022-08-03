import 'package:flutter/material.dart';

import '/models/events/happening.dart';
import '/services/provider/database_provider.dart';

class EventsList extends StatefulWidget {
  const EventsList({Key? key}) : super(key: key);

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  late List<Happening> happeningslist;
  bool loading = true;

  @override
  void initState() {
    super.initState();

    getHappeningslist();
  }

  getHappeningslist() async {
    happeningslist = await DatabaseProvider.instance.getAllHappenings();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator()
        : ListView.builder(
            itemCount: happeningslist.length,
            itemBuilder: (context, index) {
              return ListTile(
                textColor: Theme.of(context).colorScheme.onBackground,
                tileColor: Theme.of(context).colorScheme.surfaceTint,
                title: Text(happeningslist[index].name),
                subtitle: Text(happeningslist[index].description,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, '/detailedview',
                      arguments: happeningslist[index]);
                },
              );
            });
  }
}
