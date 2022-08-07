import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/home/widgets/default_card.dart';

import 'events/widgets/list_events.dart';
import 'events/widgets/starred_events.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        leading: BackButton(color: Theme.of(context).colorScheme.onBackground),
        title: Text('Events', style: Theme.of(context).textTheme.headline5),
      ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: DefaultCard(child: StarredEvents()),
          ),
          Expanded(
            child: DefaultCard(child: EventsList()),
          ),
        ],
      ),
    );
  }
}
