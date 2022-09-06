import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landesgartenschau2023/pages/home/widgets/default_card.dart';

import '/models/events/happening.dart';
import '/models/stands/stand.dart';

class Detailsview extends StatelessWidget {
  const Detailsview({Key? key, required this.happening, required this.stand})
      : super(key: key);
  final Happening? happening;
  final Stand? stand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          leading:
              BackButton(color: Theme.of(context).colorScheme.onBackground),
          title: Text(
            'Events',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.h,
                  ),
                  DefaultCard(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: SizedBox(
                              width: 500,
                              child: Text(
                                happening!.name,
                                //happening!.startdate,
                                //happening!.enddate,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ))), //Titel und darunter Datum
                  DefaultCard(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: SizedBox(
                              width: 500,
                              child: Text(
                                "Hier Standname darunter Adresse",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ))), //Standname und darunter Adresse (happening!.id & happening!.areaId)
                  DefaultCard(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: SizedBox(
                              width: 500,
                              child: Text(
                                happening!.description,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ))), //Beschreibung
                ],
              )),
        ));
  }
}
