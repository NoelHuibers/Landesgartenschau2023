import 'package:flutter/material.dart';

import '/models/events/happening.dart';

class Detailsview extends StatelessWidget {
  const Detailsview({Key? key, required this.happening}) : super(key: key);
  final Happening happening;

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
        body: ListView(
          children: <Widget>[
            Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: Text(
                  happening.name,
                  style: Theme.of(context).textTheme.subtitle1,
                )),
            Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: Text(
                  happening.description,
                  style: Theme.of(context).textTheme.bodyText2,
                )),
            /*Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: Text(happening.areaId, style: Theme.of(context).textTheme.bodyText2,)),
            Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: (happening.id, style: Theme.of(context).textTheme.bodyText2,)),*/
            Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: Text(
                  happening.startdate,
                  style: Theme.of(context).textTheme.bodyText2,
                )),
            Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: Text(
                  happening.enddate,
                  style: Theme.of(context).textTheme.bodyText2,
                )),
          ],
        ));
  }
}
