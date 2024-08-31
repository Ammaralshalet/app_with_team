import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select address'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Current location'),
            subtitle: Text('2 km away'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text('3.4 km away'),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Office'),
            subtitle: Text('2.7 km away'),
          ),
        ],
      ),
    );
  }
}
