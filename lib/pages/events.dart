import 'package:flutter/material.dart';
import 'events/widgets/list_events.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        leading: BackButton(color: Theme.of(context).colorScheme.onBackground),
        title: Text(AppLocalizations.of(context)!.events,
            style: Theme.of(context).textTheme.headline5),
      ),
      body: const EventsList(),
    );
  }
}
