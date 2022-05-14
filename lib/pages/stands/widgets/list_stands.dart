import 'package:flutter/material.dart';
import '/models/stands_model.dart';
import 'star.dart';

class Standslist extends StatelessWidget {
  const Standslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: StandsModel.standsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Star(starred: StandsModel.standsList[index]["starred"]),
            title: Text(StandsModel.standsList[index]['title']),
            subtitle: Text(StandsModel.standsList[index]['subtitle']),
            onTap: () {
              StandsModel.standsList[index]['starred'] =
                  !StandsModel.standsList[index]['starred'];
            },
          );
        },
      ),
    );
  }
}
