// lib/service/map_service.dart

import 'package:dio/dio.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

class MapService {
  final Location location = Location();
  final Dio dio = Dio();

  Future<LocationData> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // تحقق من تمكين الخدمة
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception("Location service is disabled.");
      }
    }

    // تحقق من وجود الإذن
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception("Location permission not granted.");
      }
    }

    // احصل على الموقع الحالي
    return await location.getLocation();
  }

  Future<List<Marker>> searchLocation(String query) async {
    const String apiUrl = 'https://nominatim.openstreetmap.org/search';
    final response = await dio.get(
      apiUrl,
      queryParameters: {
        'q': query,
        'format': 'json',
        'limit': 10,
        'countrycodes': 'SY', 
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map<Marker>((json) {
        final lat = double.parse(json['lat']);
        final lon = double.parse(json['lon']);
        return createMarker(lat, lon, json['display_name']);
      }).toList();
    } else {
      throw Exception('Failed to search places: ${response.statusCode}');
    }
  }

  Marker createMarker(double lat, double lon, String label) {
    return Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(lat, lon),
      child: Column(
        children: [
          const Icon(Icons.location_on, color: Colors.red, size: 40.0),
          Text(label, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
