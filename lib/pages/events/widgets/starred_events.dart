import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/models/events/happening.dart';
import '/services/provider/database_provider.dart';
import '/pages/detailsview.dart';

class StarredEvents extends StatefulWidget {
  const StarredEvents({Key? key}) : super(key: key);

  @override
  State<StarredEvents> createState() => _StarredEventsState();
}

class _StarredEventsState extends State<StarredEvents> {
  late List<Happening> happeningslist;
  bool loading = true;
  Map<int, bool> favorites = {};
  List<Happening> favoritesList = [];

  @override
  void initState() {
    super.initState();

    getHappeningslist().then((value) => loadFavorites());
  }

  Future<void> getHappeningslist() async {
    happeningslist = await DatabaseProvider.instance.getAllHappenings();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator()
        : ListView.builder(
            itemCount: favoritesList.length,
            itemBuilder: (context, index) {
              int id = favoritesList[index].id!;
              return ListTile(
                leading: IconButton(
                  icon: favorites[id]!
                      ? Icon(color: Colors.yellow, Icons.star)
                      : const Icon(Icons.star_border),
                  onPressed: () => setState(() {
                    favorites[id] = !favorites[id]!;
                  }),
                ),
                textColor: Theme.of(context).colorScheme.onBackground,
                tileColor: Theme.of(context).colorScheme.surfaceTint,
                title: Text(favoritesList[index].name),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Detailsview(
                            happening: favoritesList[index],
                          )));
                },
              );
            });
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesShared = prefs.getStringList('favorites') ?? [];
    List<int> favoritesInt = favoritesShared.map((i) => int.parse(i)).toList();
    Map<int, bool> favoriteMap = {};
    List<Happening> favoritesList2 = [];
    for (int i = 0; i < happeningslist.length; i++) {
      int id = happeningslist[i].id!;
      favoriteMap[id] = favoritesInt.contains(id);
      if (favoriteMap[id] == true) {
        favoritesList2.add(happeningslist[i]);
      }
    }
    setState(() {
      favorites = favoriteMap;
      favoritesList = favoritesList2;
    });
  }
}
