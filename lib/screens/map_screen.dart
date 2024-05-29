import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.005749655962), zoom: 14, tilt: 60);
  Set<Marker> markers = {};

  Future<Position> findPositionOnMap() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location service is disabled');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location permission is denied permanently');
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: const Text(
            'Location',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          markers: markers,
          zoomControlsEnabled: true,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Position position = await findPositionOnMap();
            googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14),
              ),
            );
            markers.clear();
            markers.add(
              Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude),
              ),
            );

            setState(() {});
          },
          label: const Text(
            'My Location',
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.my_location,
            color: Colors.white,
          ),
          backgroundColor: Colors.green.shade900,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
