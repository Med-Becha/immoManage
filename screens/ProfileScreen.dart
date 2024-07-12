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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
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
            const SizedBox(
              height: 15,
            ),
            _EditBtn(context)
          ],
        ),
      ),
    );
  }
}

Widget _itemProfile(String title, String subtitle, IconData iconData) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(color: Colors.blue),
    ),
    subtitle: Text(subtitle, style: const TextStyle(color: Colors.blue)),
    leading: Icon(
      iconData,
      color: Colors.blue,
    ),

    tileColor: Colors.white,
    //push to edit profile
    onTap: () {},
  );
}

Widget _EditBtn(context) {
  return OutlinedButton(
    onPressed: () {
      Navigator.pushNamed(context, "/editprofile");
    },
    style: OutlinedButton.styleFrom(
        // shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: const BorderSide(color: Colors.blue, width: 1)),
    child: const SizedBox(
      width: double.infinity,
      child: Text(
        'Modifier',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    ),
  );
}
