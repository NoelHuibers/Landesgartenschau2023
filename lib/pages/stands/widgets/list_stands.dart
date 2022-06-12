import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/models/stands_model.dart';

class Standslist extends StatefulWidget {
  const Standslist({Key? key}) : super(key: key);

  @override
  State<Standslist> createState() => StandslistState();
}

class StandslistState extends State<Standslist> {
  static const savedKey = 'saved_key';
  late bool save = false;

  @override
  void initState() {
    super.initState();
    _restorePersistedPreference();
  }

  void _restorePersistedPreference() async {
    var preferences = await SharedPreferences.getInstance();
    var saved = preferences.getBool(savedKey) ?? false;
    setState(() => save = saved);
  }

  void _persistPreference() async {
    setState(() => save = !save);
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool(savedKey, save);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: StandsModel.standsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: IconButton(
                icon: save
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border),
                onPressed: () {
                  setState(() {
                    if (standsList[index]['starred'] == "true") {
                      standsList[index]['starred'] = "false";
                    } else {
                      standsList[index]['starred'] = "true";
                    }
                  });
                  _persistPreference();
                }),
            title: Text(standsList[index]['title']),
            subtitle: Text(standsList[index]['subtitle']),
            onTap: () {},
          );
        },
      ),
    );
  }

  List standsList = [
    {
      "title": "Horizontbank",
      "subtitle": "Info of Horizontbank",
      "starred": "true"
    },
    {
      "title": "Weserstufen",
      "subtitle": "Info of Weserstufen",
      "starred": "true"
    },
    {
      "title": "Galeriegärten",
      "subtitle": "Info of Galeriegärten",
      "starred": "true"
    }
  ];
}
