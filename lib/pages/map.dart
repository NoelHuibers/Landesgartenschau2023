import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'map/widgets/location_controller.dart';
import 'package:location/location.dart';

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
class BigMap extends StatefulWidget {
  const BigMap({Key? key}) : super(key: key);

  @override
  State<BigMap> createState() => _BigMapState();
}

class _BigMapState extends State<BigMap> {
  double currentZoom = 13.0;
  final double currentZoomIn = 13.0;
  MapController mapController = MapController();
  late LatLng currentCenter;
  LatLng currentCenterHX = LatLng(51.773797392536636, 9.381120459653904);
  late bool _isServiceEnabled;
  late PermissionStatus _permissionGranted;
  bool? isGetLocation;
  Location location = Location();
  late LatLng mapPosition;

  //Methode zum Zoom Out
  _zoomOut() {
    currentZoom = currentZoom - 1;
    mapController.move(mapPosition, currentZoom);
  }

  //Methode zum Zoom In
  _zoomIn() {
    currentZoom = currentZoom + 1;
    mapController.move(mapPosition, currentZoom);
  }

  //Methode an die Aktuelle Position zu führen
  void concurrentPosition() {
    if (isGetLocation == true) {
      mapController.move(currentCenter, currentZoomIn);
    } else {
      mapController.move(currentCenterHX, currentZoomIn);
    }
  }

  void setPosition(LatLng center) {
    mapPosition = center;
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
  var polylines = <LatLng>[
    LatLng(51.76751715356895, 9.369571555462182),
    LatLng(51.766531165008566, 9.368729341887493),
    LatLng(51.765999983793876, 9.37112187216973),
    LatLng(51.76707561926692, 9.371454466065467),
  ];

  @override
  Widget build(BuildContext context) {
    getRealPosition();
    return StreamBuilder(
      stream: location.onLocationChanged,
      builder: (context, snapshot) {
        if (snapshot.data != null &&
            snapshot.connectionState != ConnectionState.waiting) {
          var data = snapshot.data as LocationData;
          LatLng posit = LatLng(data.latitude!, data.longitude!);
          currentCenter = posit;
          isGetLocation = true;
          return mapBuild(currentCenter);
        } else {
          isGetLocation = false;
          return mapBuild(currentCenterHX);
        }
      },
    );
  }

  Widget mapBuild(LatLng centerposition) {
    return Scaffold(
        body: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            onPositionChanged: (position, e) {
              setPosition(mapController.center);
            },
            minZoom: 10.0,
            center: centerposition,
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
                  builder: (_) {
                    if (centerposition == currentCenterHX) {
                      return withoutMarker();
                    } else {
                      return const AnimationMarker();
                    }
                  },
                  point: centerposition),
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
          buildButton("btn1", _zoomIn, 'Zoom IN', Icons.zoom_in_sharp),
          const SizedBox(height: 10),
          buildButton("btn2", _zoomOut, 'Zoom OUT', Icons.zoom_out_outlined),
          const SizedBox(height: 10),
          buildButton("btn3", concurrentPosition, 'Position',
              Icons.my_location_rounded),
          const SizedBox(height: 100),
        ]));
  }

  Widget buildButton(
      String tag, Function() function, String tip, IconData iconData) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
      heroTag: tag, //Exception Vermeiden
      onPressed: function,
      tooltip: tip,
      foregroundColor: Theme.of(context).colorScheme.onBackground,
      child: Icon(iconData),
    );
  }

  getRealPosition() async {
    _isServiceEnabled = await location.serviceEnabled();
    if (!_isServiceEnabled) {
      _isServiceEnabled = await location.requestService();
      if (_isServiceEnabled) return;
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }
  }
}
