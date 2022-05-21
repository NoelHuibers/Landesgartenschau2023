// import 'package:flutter/material.dart';
// import 'home/widgets/round_container.dart';
// import 'settings.dart';
// import '/pages/events.dart';
// import '/pages/stands.dart';
// import 'user/login_page.dart';
// import 'map.dart';
// import 'package:landesgartenschau2023/config/insets.dart';








//Dies Home Wird nicht mehr verwednet daher wird die Home_Page.dart verwendet














// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.account_circle_sharp),
//             color: Theme.of(context).iconTheme.color,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) =>  Login()),
//               );
//             },
//           ),
//           title: Center(
//               child: Text(
//             "Landesgartenschau 2023",
//             style: Theme.of(context).textTheme.headline5,
//           )),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.settings),
//               color: Theme.of(context).iconTheme.color,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Settings()),
//                 );
//               },
//             )
//           ],
//           actionsIconTheme: const IconThemeData(size: 32),
//         ),
//         body: Column(children: [
//           Flexible(
//               child: Row(children: [
//             Flexible(
//                 child: InkWell(
//               child: const RoundContainer(flex: 1),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Stands()),
//                 );
//               },
//             )),
//             Flexible(
//                 child: InkWell(
//               child: const RoundContainer(flex: 1),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           const Events()), //Veranstalltung Doppelt!!! mit zukünftige Page erstezen
//                 );
//               },
//             )),
//           ])),
//           Flexible(
//               flex: 2,
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(Insets.m),
//                     color: Theme.of(context).primaryColor),
//                 margin: const EdgeInsets.all(Insets.m),
//                 child: smallMap(),
//               )),
//         ]));
//   }
// }
