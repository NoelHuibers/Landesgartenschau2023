// import 'package:flutter/material.dart';
// import 'events/widgets/list_events.dart';
// import 'home/widgets/default_card.dart';
// import 'home/widgets/searchbar.dart';
// import 'home/widgets/starred_view.dart';
// import 'package:landesgartenschau2023/models/events_model.dart';



//Dies kann aus der build_list aufgerufen werden!!!


// class Events extends StatelessWidget {
//   const Events({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Events',
//             style: Theme.of(context).textTheme.headline5,
//           ),
//         ),
//         body: Column(children: const [
//           DefaultCard(child: Searchbar()),
//           DefaultCard(child: StarredView(model: EventsModel.eventsList)),
//           DefaultCard(child: Eventslist()),
//         ]));
//   }
// }
