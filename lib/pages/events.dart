import 'package:flutter/material.dart';

import 'events/widgets/list_events.dart';
import 'home/widgets/default_card.dart';
import 'home/widgets/searchbar.dart';
import 'home/widgets/starred_view.dart';
import '/models/events_model.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Events',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: Column(children: const [
          DefaultCard(child: Searchbar()),
          DefaultCard(child: StarredView(model: EventsModel.eventsList)),
          DefaultCard(child: Eventslist()),
        ]));
  }
}
