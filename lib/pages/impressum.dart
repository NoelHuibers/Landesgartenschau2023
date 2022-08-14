import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landesgartenschau2023/pages/login/widgets/user_tools.dart';
import 'impressum/view_impressum.dart';
import '/pages/home/widgets/default_card.dart';

class Impressum extends StatelessWidget {
  const Impressum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          leading:
              BackButton(color: Theme.of(context).colorScheme.onBackground),
          title: Text(
            'Impressum',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: ScrollConfiguration(
            behavior:
                const MaterialScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.h,
                ),
                buildText(context, 'Impressum gemäß § 5 TMG / § 55 RStV', 15),
                SizedBox(
                  height: 10.h,
                ),
                const DefaultCard(child: Impressumview()),
                SizedBox(
                  height: 7.h,
                ),
                buildText(
                    context,
                    '© Landesgartenschau Höxter 2023 GmbH \n                   Alle Rechte vorbehalten.',
                    10),
              ],
            ))));
  }
}
