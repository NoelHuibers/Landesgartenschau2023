import 'package:flutter/material.dart';
import 'events/widgets/list_events.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: const Eventslist(),
    );
  }
}
