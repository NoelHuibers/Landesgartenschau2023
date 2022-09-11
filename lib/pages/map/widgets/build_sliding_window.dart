import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landesgartenschau2023/models/events/happening.dart';
import 'package:landesgartenschau2023/models/stands/stand.dart';
import 'package:landesgartenschau2023/pages/detailsview.dart';
import 'package:landesgartenschau2023/services/provider/database_provider.dart';
import '../../home/widgets/default_card.dart';
import '../../home/widgets/searchbar.dart';
import '../../events.dart';
import '../../stands.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
/*
Die Datei ist für das Bilde der Listen, 
die in der SlidingPage zufinden sind
*/

class BuildlideWindow extends StatefulWidget {
  const BuildlideWindow({Key? key}) : super(key: key);

  @override
  State<BuildlideWindow> createState() => _BuildListState();
}

class _BuildListState extends State<BuildlideWindow> {
  String query = '';
  late List<Stand> standslist;
  late List<Happening> eventsList;
  bool loading = true;
  bool favoritesLoading = true;
  late List<Stand> copyStandslist;
  late List<Happening> copyEventsList = [];

  @override
  void initState() {
    super.initState();
    getStandsList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getStandsList() async {
    standslist = await DatabaseProvider.instance.getAllStands();
    copyStandslist = standslist;
    eventsList = await DatabaseProvider.instance.getAllHappenings();
    copyEventsList = eventsList;
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.primary,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            children: <Widget>[
              SizedBox(
                height: 35,
                child: buildSearch(),
              ),
              SizedBox(
                child: buildTextButton(
                    AppLocalizations.of(context)!.stands, const Stands()),
              ),
              SizedBox(
                height: 200,
                child: DefaultCard(
                  child: loading
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: copyStandslist.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              textColor:
                                  Theme.of(context).colorScheme.onBackground,
                              tileColor:
                                  Theme.of(context).colorScheme.surfaceTint,
                              title: Text(copyStandslist[index].name),
                              subtitle: Text(copyStandslist[index].description,
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                              trailing: Text((copyStandslist[index]
                                      .latitude
                                      .toString() +
                                  copyStandslist[index].longitude.toString())),
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
              SizedBox(
                child: buildTextButton(
                    AppLocalizations.of(context)!.events, const Events()),
              ),
              SizedBox(
                height: 200,
                child: DefaultCard(
                  child: loading
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: copyEventsList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              textColor:
                                  Theme.of(context).colorScheme.onBackground,
                              tileColor:
                                  Theme.of(context).colorScheme.surfaceTint,
                              title: Text(copyEventsList[index].name),
                              subtitle: Text(copyEventsList[index].description,
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                              trailing: Text(copyEventsList[index].startdate),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Detailsview(
                                        happening: copyEventsList[index],
                                        stand: null),
                                  ),
                                );
                              },
                            );
                          }),
                ),
              )
            ],
          ),
        ));
  }

  Widget buildTextButton(String text, Widget routing) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30,
            alignment: const Alignment(-0.89, 0),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ),
        MaterialButton(
            color: Theme.of(context).colorScheme.surfaceTint,
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => routing));
            },
            child: Icon(
              Icons.view_list_rounded,
              color: Theme.of(context).colorScheme.onBackground,
            )),
      ],
    );
  }

  Widget buildList(liste) => ListTile(
        textColor: Theme.of(context).colorScheme.onBackground,
        tileColor: Theme.of(context).colorScheme.surfaceTint,
        title: Text(
          liste.titel,
        ),
        subtitle: Text(
          liste.subtitle,
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Suchen sie in Listen',
        onChanged: search,
      );

  void search(String query) {
    final stands = standslist.where((stand) {
      final titleLower = stand.name.toLowerCase();
      final subtitelLower = stand.description.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          subtitelLower.contains(searchLower);
    }).toList();

    final events = eventsList.where((event) {
      final titleLower = event.name.toLowerCase();
      final subtitelLower = event.description.toLowerCase();
      final date = event.startdate.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          subtitelLower.contains(searchLower) ||
          date.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      copyStandslist = stands;
      copyEventsList = events;
    });
  }
}
