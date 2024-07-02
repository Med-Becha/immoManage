import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 30,
              child: CircleAvatar(
                backgroundColor:
                    Colors.blue, // Background color of the circle avatar
                radius: 50, // Radius of the circle avatar
                child: Icon(
                  Icons.person, // Icon to display inside the circle avatar
                  size: 40, // Size of the icon
                  color: Colors.white, // Color of the icon
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            _itemProfile(
                "Nom et Prénom", "Mohamed Besha Frikha", CupertinoIcons.person),
            const SizedBox(
              height: 15,
            ),
            _itemProfile("Tél", "93203366", CupertinoIcons.phone),
            const SizedBox(
              height: 15,
            ),
            _itemProfile(
                "Address", "Rte De tunis 8km", CupertinoIcons.location),
            const SizedBox(
              height: 15,
            ),
            _itemProfile("Mail", "medbesha@gamil.com", CupertinoIcons.mail),
            const SizedBox(
              height: 15,
            ),
            _itemProfile("CIN", "00000000", CupertinoIcons.barcode),
          ],
        ),
      ),
    );
  }
}

Widget _itemProfile(String title, String subtitle, IconData iconData) {
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    leading: Icon(iconData),
    trailing: const Icon(
      Icons.arrow_forward,
      color: Colors.grey,
    ),
    tileColor: Colors.white,
    //push to edit profile
    onTap: () {},
  );
}
