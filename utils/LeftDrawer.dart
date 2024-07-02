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
          ),
          ListTile(
            leading: const Icon(Icons.person_2_outlined),
            title: const Text('Mon Profile'),
            onTap: () {
              Navigator.of(context).pushNamed("/profile");
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_home_work_outlined),
            title: const Text('Mon Propriétés'),
            onTap: () => print('Upload tapped'),
          ),
          ListTile(
            leading: const Icon(Icons.content_paste_rounded),
            title: const Text('Contrats de location'),
            onTap: () => print('Contrat'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.group_outlined),
            title: const Text('Locataires'),
            onTap: () {
              Navigator.of(context).pushNamed("");
            },
          ),
          ListTile(
            leading: const Icon(Icons.home_work_outlined),
            title: const Text('Tous les Propriétés'),
            onTap: () {
              Navigator.of(context).pushNamed("");
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Déconnection'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/login");
            },
          )
        ],
      ),
    );
  }
}
