import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/models/events/happening.dart';
import '/services/provider/database_provider.dart';
import '/pages/detailsview.dart';
import '/pages/home/widgets/default_card.dart';

class EventsList extends StatefulWidget {
  const EventsList({Key? key}) : super(key: key);

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  late List<Happening> happeningslist;
  bool loading = true;
  bool favoritesLoading = true;
  Map<int, bool> favorites = {};
  List<Happening> favoritesList = [];

  @override
  void initState() {
    super.initState();

    getHappeningslist().then((value) => loadFavorites());
  }

  @override
  void dispose() {
    saveFavorites();
    super.dispose();
  }

  Future<void> getHappeningslist() async {
    happeningslist = await DatabaseProvider.instance.getAllHappenings();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: DefaultCard(
          child: favoritesLoading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: favoritesList.length,
                  itemBuilder: (context, index) {
                    int id = happeningslist[index].id!;
                    return ListTile(
                      textColor: Theme.of(context).colorScheme.onBackground,
                      tileColor: Theme.of(context).colorScheme.surfaceTint,
                      leading: IconButton(
                        icon: favorites[id]!
                            ? Icon(color: Colors.yellow, Icons.star)
                            : const Icon(Icons.star_border),
                        onPressed: () => toggleFavorite(id),
                      ),
                      title: Text(happeningslist[index].name),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Detailsview(
                                  happening: happeningslist[index],
                                )));
                      },
                    );
                  },
                ),
        ),
      ),
      Expanded(
        child: DefaultCard(
          child: loading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: happeningslist.length,
                  itemBuilder: (context, index) {
                    int id = happeningslist[index].id!;
                    return ListTile(
                      leading: IconButton(
                        icon: favorites[id]!
                            ? Icon(color: Colors.yellow, Icons.star)
                            : const Icon(Icons.star_border),
                        onPressed: () => toggleFavorite(id),
                      ),
                      textColor: Theme.of(context).colorScheme.onBackground,
                      tileColor: Theme.of(context).colorScheme.surfaceTint,
                      title: Text(happeningslist[index].name),
                      subtitle: Text(happeningslist[index].description,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Detailsview(
                                  happening: happeningslist[index],
                                )));
                      },
                    );
                  }),
        ),
      ),
    ]);
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
      favoritesLoading = false;
    });
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesShared = favorites.entries
        .where((e) => e.value)
        .map((e) => e.key.toString())
        .toList();
    prefs.setStringList('favorites', favoritesShared);
  }

  void toggleFavorite(int id) {
    setState(() {
      favoritesLoading = true;
      favorites[id] = !favorites[id]!;
      favoritesList.remove(id);
      favoritesLoading = false;
    });
  }
}
