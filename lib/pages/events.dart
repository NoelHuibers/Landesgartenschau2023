import 'package:flutter/material.dart';
import 'events/widgets/list_events.dart';
import 'home/widgets/default_card.dart';
import 'home/widgets/starred_view.dart';
import 'package:landesgartenschau2023/models/events_model.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          leading:
              BackButton(color: Theme.of(context).colorScheme.onBackground),
          title: Text(
            'Events',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: Column(children: const [
              DefaultCard(
                child: StarredView(model: EventsModel.eventsList),
              ),
              DefaultCard(child: Eventslist()),
            ])));
  }
}
