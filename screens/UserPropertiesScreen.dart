import 'package:flutter/material.dart';
import 'package:immo_manager/widgets/ImmoItem.dart';

class UserPropertiesScreen extends StatefulWidget {
  const UserPropertiesScreen({super.key});
  @override
  State<UserPropertiesScreen> createState() => _UserPropertiesScreenState();
}

class _UserPropertiesScreenState extends State<UserPropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Mon Propriétés',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/addproperties");
            },
            icon: const Icon(
              Icons.add_home_work_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => const Immoitem(
              header: "Immeuble Sedra",
              localisation: "Rte de tunis 8km Sedra - Sfax",
              label: "S+4",
              imgUrl:
                  "https://images.unsplash.com/photo-1624305612637-0ba202b43317?q=80&w=1804&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              occupation: "Disponible"),
        ),
      ),
    );
  }
}
