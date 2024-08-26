import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapWidget extends StatelessWidget {
  final MapController mapController;
  final LocationData? currentLocation;
  final List<Marker> markers;

  const MapWidget({
    Key? key,
    required this.mapController,
    required this.currentLocation,
    required this.markers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
       initialCenter : LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        initialZoom: 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: markers,
        ),
      ],
    );
  }
}
