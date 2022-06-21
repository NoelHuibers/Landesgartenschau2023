import 'package:flutter/material.dart';

class StarredView extends StatelessWidget {
  const StarredView({
    Key? key,
    required this.model,
  }) : super(key: key);
  final List model;

  @override
  Widget build(BuildContext context) {
    bool lines = false;
    return SafeArea(
      child: ListView.builder(
        itemCount: model.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            textColor: Theme.of(context).colorScheme.onBackground,
            tileColor: Theme.of(context).colorScheme.surfaceTint,
            title: Text(model[index]['title']),
            subtitle: Text(model[index]['subtitle'],
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
