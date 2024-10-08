import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/authController.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final AuthController authController = Get.find();

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
      body: Obx(
        () {
          final user = authController.user.value;
          return Padding(
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
                _itemProfile("Nom et Prénom", user?.name ?? "undefined",
                    CupertinoIcons.person),
                const SizedBox(
                  height: 15,
                ),
                _itemProfile(
                    "Tél", user?.phone ?? "undefined", CupertinoIcons.phone),
                const SizedBox(
                  height: 15,
                ),
                _itemProfile(
                    "Mail", user?.email ?? "undefined", CupertinoIcons.mail),
                const SizedBox(
                  height: 15,
                ),
                // _editBtn(context)
              ],
            ),
          );
        },
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
    onTap: () {},
  );
}
