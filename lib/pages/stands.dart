import 'package:flutter/material.dart';
import 'stands/widgets/list_stands.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Stands extends StatelessWidget {
  const Stands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          leading:
              BackButton(color: Theme.of(context).colorScheme.onBackground),
          title: Text(
            AppLocalizations.of(context)!.stands,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
          child: const StandsList(),
        ));
  }
}
