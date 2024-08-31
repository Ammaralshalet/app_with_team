import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Payment confirm'),
            subtitle: Text('Lorem ipsum dolor sit amet consectetur...'),
            trailing: Text('5 min ago'),
          ),
          ListTile(
            title: Text('Payment confirm'),
            subtitle: Text('Lorem ipsum dolor sit amet consectetur...'),
            trailing: Text('6 min ago'),
          ),
          Divider(),
          ListTile(
            title: Text('Payment confirm'),
            subtitle: Text('Lorem ipsum dolor sit amet consectetur...'),
            trailing: Text('1 day ago'),
          ),
          ListTile(
            title: Text('Payment confirm'),
            subtitle: Text('Lorem ipsum dolor sit amet consectetur...'),
            trailing: Text('2 days ago'),
          ),
        ],
      ),
    );
  }
}
