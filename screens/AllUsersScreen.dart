import 'package:flutter/material.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Locataires",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: _buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    List<String> titles = [
      'Ahmed Ahmed',
      'malek malek',
      'racem racem',
      'hassan hassan'
          'racem racem',
      'hassan hassan' 'racem racem',
      'hassan hassan' 'racem racem',
      'hassan hassan' 'racem racem',
      'hassan hassan' 'racem racem',
      'hassan hassan' 'racem racem',
      'hassan hassan' 'racem racem',
      'hassan hassan'
    ];
    List<String> subtitles = [
      'Ahmed@gmail.com',
      'malek@gmail.com',
      'racem@gmail.com',
      '+2169336666655'
          'racem@gmail.com',
      '+2169336666655',
      'racem@gmail.com',
      '+2169336666655',
      'racem@gmail.com',
      '+2169336666655',
      'racem@gmail.com',
      '+2169336666655'
    ];

    List<Widget> listTiles = [];

    for (int i = 0; i < titles.length; i++) {
      listTiles.add(
        ListTile(
          hoverColor: Colors.lightBlue,
          leading: const Icon(
            Icons.person_2_outlined,
            color: Colors.blue,
          ),
          title: Text(
            titles[i],
            style: const TextStyle(color: Colors.blue),
          ),
          subtitle: Text(
            subtitles[i],
            style: const TextStyle(color: Colors.blue),
          ),
          trailing: const Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          onTap: () {
            // Handle tap
            print('Tapped on ${titles[i]}');
          },
        ),
      );
      listTiles.add(
        const Divider(
          color: Colors.blue,
        ),
      );
    }

    return listTiles;
  }
}
