import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landesgartenschau2023/pages/home/widgets/default_card.dart';
import '/models/events/happening.dart';
import '/models/stands/stand.dart';
import 'package:intl/intl.dart';

class Detailsview extends StatelessWidget {
  const Detailsview({Key? key, required this.happening, required this.stand})
      : super(key: key);
  final Happening? happening;
  final Stand? stand;

  @override
  Widget build(BuildContext context) {
    String? name = happening?.name ?? stand?.name;
    int? areaId = happening?.areaId ?? stand?.id;
    String? description = happening?.description ?? stand?.description;
    String startdate = happening?.startdate ?? "2023-05-02 15:30:00";
    String enddate = happening?.enddate ?? "2023-05-02 15:30:00";
    final inputstart = DateTime.parse(startdate);
    final inputend = DateTime.parse(enddate);
    var outputFormat = DateFormat('EEEE, d.MMMM HH:mm');
    var outputstart = outputFormat.format(inputstart);
    var outputend = outputFormat.format(inputend);

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
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: SizedBox(
                              width: 500,
                              child: Text(
                                "$name\n$outputstart\n$outputend",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ))),
                  DefaultCard(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: SizedBox(
                              width: 500,
                              child: Text(
                                "AreaId: $areaId",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ))),
                  DefaultCard(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: SizedBox(
                              width: 500,
                              child: Text(
                                description!,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ))), //Beschreibung
                ],
              )),
        ));
  }
}
