import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class TestPolyLinesScreen extends StatefulWidget {
  const TestPolyLinesScreen({super.key});

  @override
  State<TestPolyLinesScreen> createState() => _TestPolyLinesScreenState();
}

class _TestPolyLinesScreenState extends State<TestPolyLinesScreen> {
  late GoogleMapController mapController;
  late CameraPosition initialCameraPosition;
  late CameraPosition currentCameraPosition;
  bool onCameraMoveStarted = false;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  String address = "";
  List<LatLng> polylineCoordinates = [];

  _init() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBxS8AE12qyXZEhSqiEbwAVIZd-FlFfWkY",
      const PointLatLng(41.0058, 71.6436),
      const PointLatLng(41.2995, 69.2401),
      travelMode: TravelMode.walking,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    print("POLYLINES LENGHTH:${result.points}");
    _addPolyLine();
  }

  @override
  void initState() {
    _init();
    initialCameraPosition = CameraPosition(target: LatLng(41, 70), zoom: 15);

    currentCameraPosition = CameraPosition(target: LatLng(41, 70), zoom: 15);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onCameraMoveStarted: () {
          setState(() {
            onCameraMoveStarted = true;
          });
        },
        onCameraMove: (CameraPosition cameraPosition) {
          currentCameraPosition = cameraPosition;
        },
        onCameraIdle: () {},
        initialCameraPosition: CameraPosition(
          target: initialCameraPosition.target,
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
        polylines: Set<Polyline>.of(polylines.values),
      ),
    );
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.green,
      width: 3,
      points: polylineCoordinates,
    );
    polylines[id] = polyline;
    setState(() {});
  }
}
