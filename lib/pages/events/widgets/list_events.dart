import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/pages/home/widgets/searchbar.dart';
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
  Map<Happening, bool> favorites = {};
  List<Happening> favoritesList = [];
  late List<Happening> copyHappeningslist = [];
  late List<Happening> copyFavoritesList = [];
  String query = '';

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
    copyHappeningslist = happeningslist;
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.primary,
        child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 35.h,
                    width: 15,
                    child: buildSearch(),
                  ),
                  const SizedBox(
                    height: 15,
                    width: 0,
                  ),
                  SizedBox(
                    height: 200.h,
                    width: 450,
                    child: DefaultCard(
                      child: favoritesLoading
                          ? const CircularProgressIndicator()
                          : ListView.builder(
                              itemCount: copyFavoritesList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  textColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  tileColor:
                                      Theme.of(context).colorScheme.surfaceTint,
                                  leading: IconButton(
                                    icon: favorites[copyFavoritesList[index]]!
                                        ? const Icon(
                                            color: Color.fromARGB(
                                                255, 255, 235, 59),
                                            Icons.star)
                                        : const Icon(Icons.star_border),
                                    onPressed: () => toggleFavorite(
                                        copyFavoritesList[index]),
                                  ),
                                  title: Text(copyFavoritesList[index].name),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Detailsview(
                                            happening: copyFavoritesList[index],
                                            stand: null),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                    width: 0,
                  ),
                  SizedBox(
                    height: 350.h,
                    width: 390,
                    child: DefaultCard(
                      child: loading
                          ? const CircularProgressIndicator()
                          : ListView.builder(
                              itemCount: copyHappeningslist.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: IconButton(
                                    icon: favorites[copyHappeningslist[index]]!
                                        ? const Icon(
                                            color: Color.fromARGB(
                                                255, 255, 235, 59),
                                            Icons.star)
                                        : const Icon(Icons.star_border),
                                    onPressed: () => toggleFavorite(
                                        copyHappeningslist[index]),
                                  ),
                                  textColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  tileColor:
                                      Theme.of(context).colorScheme.surfaceTint,
                                  title: Text(copyHappeningslist[index].name),
                                  subtitle: Text(
                                      copyHappeningslist[index].description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  trailing:
                                      Text(copyHappeningslist[index].startdate),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Detailsview(
                                            happening:
                                                copyHappeningslist[index],
                                            stand: null),
                                      ),
                                    );
                                  },
                                );
                              }),
                    ),
                  ),
                ])));
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Suchen sie in Events',
        onChanged: search,
      );

  void search(String query) {
    final events = happeningslist.where((event) {
      final titleLower = event.name.toLowerCase();
      final subtitelLower = event.description.toLowerCase();
      final date = event.startdate.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          subtitelLower.contains(searchLower) ||
          date.contains(searchLower);
    }).toList();

    final favorites = favoritesList.where((fav) {
      final titleLower = fav.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      copyHappeningslist = events;
      copyFavoritesList = favorites;
    });
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesShared = prefs.getStringList('favorites') ?? [];
    List<int> favoritesInt = favoritesShared.map((i) => int.parse(i)).toList();
    Map<Happening, bool> favoriteMap = {};
    for (int i = 0; i < happeningslist.length; i++) {
      int id = happeningslist[i].id!;
      favoriteMap[happeningslist[i]] = favoritesInt.contains(id);
    }
    setState(() {
      favorites = favoriteMap;
      favoritesList =
          favorites.entries.where((e) => e.value).map((e) => e.key).toList();
      favoritesLoading = false;
      copyFavoritesList = favoritesList;
    });
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesShared = favorites.entries
        .where((e) => e.value)
        .map((e) => e.key.id.toString())
        .toList();
    prefs.setStringList('favorites', favoritesShared);
  }

  void toggleFavorite(Happening happening) {
    setState(() {
      favorites[happening] = !favorites[happening]!;
      favoritesList =
          favorites.entries.where((e) => e.value).map((e) => e.key).toList();
      copyFavoritesList = favoritesList;
    });
  }
}
