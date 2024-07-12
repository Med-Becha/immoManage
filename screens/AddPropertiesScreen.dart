import 'package:flutter/material.dart';

class AddPropertiesScreen extends StatelessWidget {
  const AddPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Ajouter une propriété',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Text("Add properties Screen"),
    );
  }
}
