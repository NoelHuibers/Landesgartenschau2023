import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/models/happenings.dart';
import '/services/provider/database_provider.dart';

class Eventslist extends StatelessWidget {
  const Eventslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Happening>>(
        future: DatabaseProvider.db.getAllHappenings(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Happening happening = snapshot.data![index];
                return ListTile(
                  textColor: Theme.of(context).colorScheme.onBackground,
                  tileColor: Theme.of(context).colorScheme.surfaceTint,
                  title: Text(happening.name),
                  subtitle: Text(happening.description,
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/event',
                        arguments: happening);
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
