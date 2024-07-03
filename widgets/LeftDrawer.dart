import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Mohamed Becha"),
            accountEmail: Text("medbesha@gmail.com"),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: const Icon(
              Icons.person_2_outlined,
              color: Colors.blue,
            ),
            title: const Text(
              'Mon Profile',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/profile");
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.add_home_work_outlined,
              color: Colors.blue,
            ),
            title: const Text(
              'Mon Propriétés',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () => Navigator.of(context).pushNamed("/userproperties"),
          ),
          ListTile(
            leading: const Icon(
              Icons.content_paste_rounded,
              color: Colors.blue,
            ),
            title: const Text(
              'Contrats de location',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.group_outlined,
              color: Colors.blue,
            ),
            title: const Text(
              'Locataires',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("");
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.bar_chart_sharp,
              color: Colors.blue,
            ),
            title: const Text(
              'Tableau de Bord',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/chart");
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            title: const Text(
              'Déconnection',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/login");
            },
          )
        ],
      ),
    );
  }
}
