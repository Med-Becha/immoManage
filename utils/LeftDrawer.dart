import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
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
            leading: const Icon(Icons.home),
            title: const Text('Acceil'),
            onTap: () => print(''),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => print('Upload tapped'),
          ),
          ListTile(
            leading: const Icon(Icons.home_work),
            title: const Text('Propriétés'),
            onTap: () => print('Upload tapped'),
          ),
          ListTile(
            leading: const Icon(Icons.content_paste),
            title: const Text('Contrat'),
            onTap: () => print('Contrat'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Déconnection'),
            onTap: () => print('Contrat'),
          )
        ],
      ),
    );
  }
}
