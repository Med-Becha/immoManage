import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/propertyController.dart';
import 'package:immo_manager/widgets/ImmoItem.dart';

class UserPropertiesScreen extends StatefulWidget {
  const UserPropertiesScreen({super.key});

  @override
  State<UserPropertiesScreen> createState() => _UserPropertiesScreenState();
}

class _UserPropertiesScreenState extends State<UserPropertiesScreen> {
  final PropertyController _propertyController = Get.find<PropertyController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchProperties();
    });
  }

  // Fetch user properties
  Future<void> _fetchProperties() async {
    await _propertyController.fetchUserProperties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Mes Propriétés',
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
      body: RefreshIndicator(
        onRefresh: _fetchProperties,
        child: Obx(() {
          if (_propertyController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_propertyController.userProperties.isEmpty) {
            return Center(child: Text('No properties found'));
          }

          return ListView.builder(
            itemCount: _propertyController.userProperties.length,
            itemBuilder: (context, index) {
              final property = _propertyController.userProperties[index];
              return Immoitem(
                header: property.name,
                localisation: property.location,
                label: property.sizes,
                imgUrl: property.images?.isNotEmpty == true
                    ? "http://localhost:8080/images/${property.images!.first.name}" // Display the first image URL
                    : "https://images.unsplash.com/photo-1516883870728-9e398630f638?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Placeholder image URL
                occupation: property.status,
              );
            },
          );
        }),
      ),
    );
  }
}
