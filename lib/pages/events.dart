import 'package:flutter/material.dart';
import 'events/widgets/list_events.dart';

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
      body: const Eventslist(),
    );
  }
}
