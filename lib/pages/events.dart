import 'package:flutter/material.dart';

/* Auf List<String> wurde ich später verzichten und 
List<Wiget> aus Containern erstellen, somit kann jeder Container 
ihre eigene eigenschaften gegeben werden */

List<String> eventList = [
  "Horizontbank",
  "Weserstufen",
  "Galeriegärten",
  "Hausgärten",
  "Porzellangarten",
  "Berliner Platz",
  "TH-OWL",
  "Buddha-Garten",
  "Grabgestaltung",
  "Lesegarten",
  "Pavillon der Ortschaften",
  "Uferwiese",
  "Schöpfungsgarten",
  "Wassergarten im Wald",
  "Storchennset",
  "Blumenhalle",
  "Besucherzentrum",
  "Archäologiepark",
  "Natur -und Umweltschuutz-Akademie NRW",
  "Naturnahes Gärtnern",
  "Historischer Rastplatz",
  "Obstplantage",
  "Landwirtschaft",
  "Gärtnermarkt",
  "Baumschulen",
  "Buntes Klassenzimmer",
  "Imker",
  "Energiegarten",
  "Duft- und Rosengarten",
  "Apothekergarten",
  "Küchengartenkabinett",
  "Geophytenwiese"
];

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Events",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),

      /* Es wurde GridView.builder verwednet */
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.5),
        itemBuilder: (context, index) {
          return Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "$index ${eventList[index]}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
              height: 30,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ));
        },
        itemCount: eventList.length,
      ),
    );
  }
}
