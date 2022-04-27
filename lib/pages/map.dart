import 'package:flutter/material.dart';
import '../models/map_marker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class smallMap extends StatefulWidget {
  @override
  smallMapState createState() => smallMapState();
}

// ignore: camel_case_types
class smallMapState extends State<smallMap> {
  LatLng currentCenter = LatLng(51.773797392536636, 9.381120459653904);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
          //ClipRRect wird verwendet, um Widgets auf benutzerdefinierte Weise zu schneiden
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          child: Align(
            child: FlutterMap(
              options: MapOptions(
                minZoom: 3.0,
                center: currentCenter,
              ),
              layers: [
                TileLayerOptions(
                  maxNativeZoom: 18,
                  maxZoom: 22,
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => bigMap()),
          );
        },
        tooltip: 'Vergrößern',
        child: const Icon(Icons.fit_screen_outlined),
      ),
    );
  }
}
//Dies dient dazu die StändeKoordinaten in die große Map einzufügen
// diese Wird zunächst kommentiert bis wir die Daten haben
// List<Marker> markerBilder(){
//   final markerliste = <Marker>[];
//   for(int i = 0; i < mapMarkers.length; i++){
//     final mapItem = mapMarkers[i];
//     markerliste.add(
//       Marker(
//         height: 45,
//         width: 45,
//         point: mapItem.koordinaten,
//         builder: (_){
//           return GestureDetector(
//             onTap: (){
//               print('Selected: ${mapItem.image}');
//             },
//             child: Image.asset("Hier kann das LocationLogo ausgewählt werden ")
//           )
//         }
//         )
//     )
//   }
// }

class bigMap extends StatelessWidget {
  bigMap({Key? key}) : super(key: key);
  double currentZoom = 13.0;
  MapController mapController = MapController();
  LatLng currentCenter = LatLng(51.773797392536636, 9.381120459653904);

  //Die genauere Position wird aus der Location datei geholt
  LatLng genauePosition = LatLng(51.76685404294687, 9.370506747991776);

  //Methode zum Zoom Out
  void _zoomOut() {
    currentZoom = currentZoom - 1;
    mapController.move(currentCenter, currentZoom);
  }

  //Methode zum Zoom In
  void _zoomIn() {
    currentZoom = currentZoom + 1;
    mapController.move(currentCenter, currentZoom);
  }

  //Methode an die Aktuelle Position zu führen
  void cuncretPosition() {
    currentZoom = currentZoom + 3;
    mapController.move(genauePosition, currentZoom);
    addUserLocation();
  }

  //Die Methode ist für das Adden die Marker auf der Karte
  List<Marker> markerBild() {
    final markerListe = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      markerListe.add(Marker(
          height: 45.0,
          width: 45.0,
          point: mapItem.koordinaten,
          builder: (_) {
            return GestureDetector(
              onTap: () {
                print('Ausgewählt:  ${mapItem.title}');
              },
              child:
                  Image.asset("hier Kann die Makierungslogo eingefügt werden "),
            );
          }));
    }
    return markerListe;
  }

  //Beispiel Koordinaten zum testen
  var position = <LatLng>[
    LatLng(51.76641692390064, 9.371780740209607),
    LatLng(51.76971011625946, 9.372660504708008),
    LatLng(51.77115745141267, 9.373003827439092),
    LatLng(51.77228607505853, 9.371029721735363),
    LatLng(51.77370677293457, 9.370085584224883),
    LatLng(51.77398559623967, 9.375042306154901),
    LatLng(51.774091814188516, 9.379376755634828),
    LatLng(51.77272423898608, 9.380385266157386),
    LatLng(51.77256490714099, 9.38137231900925),
    LatLng(51.772830459903666, 9.382037506800726),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Map'),
        ),
        body: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            minZoom: 10.0,
            center: currentCenter,
          ),
          layers: [
            TileLayerOptions(
              maxNativeZoom: 18,
              maxZoom: 22,
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(markers: [
              Marker(
                  point: genauePosition,
                  builder: (_) {
                    return addUserLocation();
                  })
            ]
                // markers: markerBild(),
                ),
            PolylineLayerOptions(polylines: [
              Polyline(points: position, strokeWidth: 5.0, color: Colors.blue)
            ]),
          ],
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            heroTag: "btn1", // Exception Vermeiden
            onPressed: _zoomIn,
            tooltip: 'Zoom IN',
            child: const Icon(Icons.zoom_in_sharp),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: _zoomOut,
            tooltip: 'Zoom OUT',
            child: const Icon(Icons.zoom_out_outlined),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btn3",
            onPressed: cuncretPosition,
            tooltip: 'Position',
            child: const Icon(Icons.my_location_rounded),
          )
        ]));
  }
}

class addUserLocation extends StatelessWidget {
  LatLng currentCenter = LatLng(51.773797392536636, 9.381120459653904);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 45.0,
        height: 45.0,
        child: IconButton(
          icon: const Icon(Icons.location_on),
          color: Colors.blue,
          iconSize: 45.0,
          onPressed: () {
            print("Hier ist die Aktuelle Position");
          },
        ));
  }
}
