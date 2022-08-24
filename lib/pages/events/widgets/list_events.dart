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
                              itemCount: favoritesList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  textColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  tileColor:
                                      Theme.of(context).colorScheme.surfaceTint,
                                  leading: IconButton(
                                    icon: favorites[favoritesList[index]]!
                                        ? Icon(color: Colors.yellow, Icons.star)
                                        : const Icon(Icons.star_border),
                                    onPressed: () =>
                                        toggleFavorite(favoritesList[index]),
                                  ),
                                  title: Text(favoritesList[index].name),
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => Detailsview(
                                                  happening:
                                                      favoritesList[index],
                                                )));
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
                              itemCount: happeningslist.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: IconButton(
                                    icon: favorites[happeningslist[index]]!
                                        ? Icon(color: Colors.yellow, Icons.star)
                                        : const Icon(Icons.star_border),
                                    onPressed: () =>
                                        toggleFavorite(happeningslist[index]),
                                  ),
                                  textColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  tileColor:
                                      Theme.of(context).colorScheme.surfaceTint,
                                  title: Text(happeningslist[index].name),
                                  subtitle: Text(
                                      happeningslist[index].description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  trailing:
                                      Text(happeningslist[index].startdate),
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => Detailsview(
                                                  happening:
                                                      happeningslist[index],
                                                )));
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

  void search(String query) {}

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
    });
  }
}
