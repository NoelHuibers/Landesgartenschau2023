import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/pages/home/widgets/searchbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/models/stands/stand.dart';
import '/services/provider/database_provider.dart';
import '/pages/detailsview.dart';
import '/pages/home/widgets/default_card.dart';

class StandsList extends StatefulWidget {
  const StandsList({Key? key}) : super(key: key);

  @override
  State<StandsList> createState() => _StandsListState();
}

class _StandsListState extends State<StandsList> {
  late List<Stand> standslist;
  bool loading = true;
  bool favoritesLoading = true;
  Map<Stand, bool> favorites = {};
  List<Stand> favoritesList = [];
  late List<Stand> copyStandslist;
  late List<Stand> copyFavoritesList = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    getStandsList().then((value) => loadFavorites());
  }

  @override
  void dispose() {
    saveFavorites();
    super.dispose();
  }

  Future<void> getStandsList() async {
    standslist = await DatabaseProvider.instance.getAllStands();
    copyStandslist = standslist;
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
                                        ? Icon(color: Colors.yellow, Icons.star)
                                        : const Icon(Icons.star_border),
                                    onPressed: () => toggleFavorite(
                                        copyFavoritesList[index]),
                                  ),
                                  title: Text(copyFavoritesList[index].name),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Detailsview(
                                          stand: copyFavoritesList[index],
                                          happening: null,
                                        ),
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
                              itemCount: copyStandslist.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: IconButton(
                                    icon: favorites[copyStandslist[index]]!
                                        ? Icon(color: Colors.yellow, Icons.star)
                                        : const Icon(Icons.star_border),
                                    onPressed: () =>
                                        toggleFavorite(copyStandslist[index]),
                                  ),
                                  textColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  tileColor:
                                      Theme.of(context).colorScheme.surfaceTint,
                                  title: Text(copyStandslist[index].name),
                                  subtitle: Text(
                                      copyStandslist[index].description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  trailing: Text((copyStandslist[index]
                                          .latitude
                                          .toString() +
                                      copyStandslist[index]
                                          .longitude
                                          .toString())),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Detailsview(
                                            stand: copyStandslist[index],
                                            happening: null),
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
        hintText: 'Suchen sie in Ständen',
        onChanged: search,
      );

  void search(String query) {
    final stand = standslist.where((stand) {
      final titleLower = stand.name.toLowerCase();
      final subtitelLower = stand.description.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          subtitelLower.contains(searchLower);
    }).toList();

    final favorites = favoritesList.where((fav) {
      final titleLower = fav.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      copyStandslist = stand;
      copyFavoritesList = favorites;
    });
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesShared = prefs.getStringList('favoritesstands') ?? [];
    List<int> favoritesInt = favoritesShared.map((i) => int.parse(i)).toList();
    Map<Stand, bool> favoriteMap = {};
    for (int i = 0; i < standslist.length; i++) {
      int id = standslist[i].id!;
      favoriteMap[standslist[i]] = favoritesInt.contains(id);
    }
    setState(() {
      favorites = favoriteMap;
      favoritesList =
          favorites.entries.where((e) => e.value).map((e) => e.key).toList();
      copyFavoritesList = favoritesList;
      favoritesLoading = false;
    });
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritesShared = favorites.entries
        .where((e) => e.value)
        .map((e) => e.key.id.toString())
        .toList();
    prefs.setStringList('favoritesstands', favoritesShared);
  }

  void toggleFavorite(Stand stand) {
    setState(() {
      favorites[stand] = !favorites[stand]!;
      favoritesList =
          favorites.entries.where((e) => e.value).map((e) => e.key).toList();
      copyFavoritesList = favoritesList;
    });
  }
}
