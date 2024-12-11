import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            accountName: Text(
              'Nate Samson',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              'nate@email.com',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                createDrawerItem(
                  icon: Icons.history,
                  text: 'History',
                  onTap: () {},
                ),
                createDrawerItem(
                  icon: Icons.report,
                  text: 'Complain',
                  onTap: () {},
                ),
                createDrawerItem(
                  icon: Icons.group,
                  text: 'Referral',
                  onTap: () {},
                ),
                createDrawerItem(
                  icon: Icons.info,
                  text: 'About Us',
                  onTap: () {},
                ),
                createDrawerItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  onTap: () {},
                ),
                createDrawerItem(
                  icon: Icons.help,
                  text: 'Help and Support',
                  onTap: () {},
                ),
                createDrawerItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget createDrawerItem(
    {IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(text!),
    onTap: onTap,
  );
}
