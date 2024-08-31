import 'package:flutter/material.dart';

class LocationConfirmScreen extends StatelessWidget {
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
            subtitle: Text('23 St. New York, USA'),
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Office'),
            subtitle: Text('221B Baker Street, London'),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Confirm Location'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
