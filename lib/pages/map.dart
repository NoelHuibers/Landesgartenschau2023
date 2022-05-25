import 'package:flutter/material.dart';
import 'package:landesgartenschau2023/pages/settings.dart';
import 'package:landesgartenschau2023/pages/user/login_page.dart';
import '../models/map_marker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'map/widgets/location_controller.dart';

//Die genauere Position wird aus der Location datei geholt
LatLng genauePosition = LatLng(51.76685404294687, 9.370506747991776);

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
  var mapPosition;

  //Methode zum Zoom Out
  void _zoomOut() {
    currentZoom = currentZoom - 1;
    mapController.move(mapPosition, currentZoom);
  }

  //Methode zum Zoom In
  void _zoomIn() {
    currentZoom = currentZoom + 1;
    mapController.move(mapPosition, currentZoom);
  }

  //Methode an die Aktuelle Position zu führen
  void cuncretPosition() {
    currentZoom = currentZoom + 3;
    mapController.move(genauePosition, currentZoom);
  }

  void setPosition(LatLng center) {
    mapPosition = center;
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
  //diese positionsdaten kommen aus backend
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
  var polylines = <LatLng>[
    LatLng(51.76751715356895, 9.369571555462182),
    LatLng(51.766531165008566, 9.368729341887493),
    LatLng(51.765999983793876, 9.37112187216973),
    LatLng(51.76707561926692, 9.371454466065467),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            onPositionChanged: (position, e) {
              setPosition(mapController.center);
            },
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
                  height: 60,
                  width: 60,
                  //ExampleAppState.userPosition,nn
                  builder: (_) {
                    return const animationMarker();
                  },
                  point: currentCenter),
            ]),
            PolylineLayerOptions(polylines: [
              Polyline(points: position, strokeWidth: 5.0, color: Colors.blue)
            ]),
            PolygonLayerOptions(polygons: [
              Polygon(points: polylines, color: Colors.red.withOpacity(0.3))
            ]),
          ],
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          build_button("btn1", _zoomIn, 'Zoom IN', Icons.zoom_in_sharp),
          const SizedBox(height: 10),
          build_button("btn2", _zoomOut, 'Zoom OUT', Icons.zoom_out_outlined),
          const SizedBox(height: 10),
          build_button(
              "btn3", cuncretPosition, 'Position', Icons.my_location_rounded),
          const SizedBox(height: 30),
        ]));
  }

  Widget build_button(
      String tag, Function() function, String tip, IconData iconData) {
    return FloatingActionButton(
      heroTag: tag, //Exception Vermeiden
      onPressed: function,
      tooltip: tip,
      child: Icon(iconData),
    );
  }
}
