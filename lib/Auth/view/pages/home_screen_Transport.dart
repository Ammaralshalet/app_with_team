import 'dart:io';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:app_with_team/Auth/view/widget/Card.dart';
import 'package:app_with_team/Auth/view/widget/Drawer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class HomeScreenTransport extends StatefulWidget {
  const HomeScreenTransport({super.key});

  @override
  State<HomeScreenTransport> createState() => _HomeScreenTransportState();
}

class _HomeScreenTransportState extends State<HomeScreenTransport> {
  LocationData? currentLocation;
  final MapController mapController = MapController();
  List<Marker> markers = [];
  final Location location = Location();
  late Stream<LocationData> locationStream;

  bool isTransportSelected = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setState(() {
        currentLocation = LocationData.fromMap({
          'latitude': 33.5094859,
          'longitude': 36.2939331,
        });
        _addCurrentLocationMarker();
      });
    } else {
      _getCurrentLocation();
      locationStream = location.onLocationChanged;
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
        _addCurrentLocationMarker();
      });
    } catch (e) {
      currentLocation = null;
    }

    locationStream.listen((LocationData newLocation) {
      setState(() {
        currentLocation = newLocation;
        mapController.move(
            LatLng(newLocation.latitude!, newLocation.longitude!), 20.0);
        _updateCurrentLocationMarker(newLocation);
      });
    });
  }

  void searchMap(String query) async {
    if (query.isEmpty || currentLocation == null) return;

    final dio = Dio();
    final String apiUrl = 'https://nominatim.openstreetmap.org/search';

    try {
      final response = await dio.get(
        apiUrl,
        queryParameters: {
          'q': query,
          'format': 'json',
          'limit': 10,
          'lat': currentLocation!.latitude,
          'lon': currentLocation!.longitude,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        setState(() {
          markers.clear(); // Clear previous markers
          markers.addAll(data.map((json) {
            final lat = double.parse(json['lat']);
            final lon = double.parse(json['lon']);
            return Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(lat, lon),
              child: Column(
                children: [
                  const Icon(Icons.location_on, color: Colors.red, size: 40.0),
                  Text(json['display_name'],
                      style: const TextStyle(color: Colors.black)),
                ],
              ),
            );
          }).toList());
        });
      } else {
        print('Failed to search places: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error searching places: ${e.response?.statusCode}');
        print('Response data: ${e.response?.data}');
        print('Request headers: ${e.requestOptions.headers}');
      } else {
        print('Error sending request: ${e.message}');
      }
    }
  }

  void _addCurrentLocationMarker() {
    if (currentLocation != null) {
      markers.add(
        Marker(
          width: 250.0,
          height: 250.0,
          point:
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          child: Image.asset(
            'assets/MyLocation.png',
          ),
        ),
      );
    }
  }

  void _updateCurrentLocationMarker(LocationData locationData) {
    if (markers.isNotEmpty) {
      markers[0] = Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(locationData.latitude!, locationData.longitude!),
        child: const Icon(Icons.my_location, color: Colors.blue, size: 40.0),
      );
    }
  }

  @override
  void dispose() {
    if (!Platform.isWindows && !Platform.isLinux && !Platform.isMacOS) {
      locationStream.drain();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(138, 212, 181, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Icon(
                Icons.menu,
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications_none_sharp,
                      // color: Color.fromRGBO(194, 204, 222, 0.25),
                    ))),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          // FlutterMap لإظهار الخريطة
          currentLocation == null
              ? const Center(child: FlutterLogo())
              : FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    initialCenter: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    initialZoom: 15.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: markers,
                    ),
                  ],
                ),

          Positioned(
            bottom: 160.0,
            right: 25.0,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                if (currentLocation != null) {
                  mapController.move(
                      LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                      15.0);
                }
              },
              child: const Icon(Icons.my_location),
            ),
          ),

          // إضافة MainButton أعلى الخريطة
          Positioned(
            bottom: 160.0,
            left: 25.0,
            right: 300.0,
            child: MainButton(
              textTheButton: "Rental",
              onTap: () {
                // Action for Rental Button
              },
            ),
          ),

          // وضع MyCustomWidget في أسفل الشاشة
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: MyCustomWidget(),
          ),
        ],
      ),
    );
  }
}
