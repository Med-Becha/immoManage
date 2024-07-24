import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/models/propertyModel.dart'; // Import your Property model
import 'package:immo_manager/screens/EditPropertyScreen.dart'; // Import the Edit Property Screen

class PropertyDetailsScreen extends StatelessWidget {
  final Property property;

  const PropertyDetailsScreen({super.key, required this.property});

  void _editProperty(BuildContext context) {
    // Navigate to the edit screen with the current property details
    Get.to(
      () => EditPropertyScreen(property: property),
      fullscreenDialog:
          true, // Optional: makes the edit screen look like a modal
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          property.name,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editProperty(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            property.images?.isNotEmpty == true
                ? Image.network(
                    "http://localhost:8080/images/${property.images!.first.name}")
                : Image.network(
                    "https://images.unsplash.com/photo-1516883870728-9e398630f638?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            const SizedBox(height: 16.0),
            Text('Name: ${property.name}'),
            Text('Location: ${property.location}'),
            Text('Sizes: ${property.sizes}'),
            Text('Status: ${property.status}'),
            // Add other property details here
          ],
        ),
      ),
    );
  }
}
