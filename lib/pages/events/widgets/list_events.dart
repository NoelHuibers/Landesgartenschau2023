import 'package:flutter/material.dart';

import '/models/events_model.dart';

class Eventslist extends StatelessWidget {
  const Eventslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lines = false;
    return SafeArea(
      child: ListView.builder(
        itemCount: EventsModel.eventsList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(EventsModel.eventsList[index]['title']),
            subtitle: Text(EventsModel.eventsList[index]['subtitle'],
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
