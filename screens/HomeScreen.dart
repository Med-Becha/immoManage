import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/propertyController.dart';
import 'package:immo_manager/widgets/ImmoItem.dart';
import 'package:immo_manager/widgets/LeftDrawer.dart';
import 'package:immo_manager/widgets/Filters.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyController _propertyController =
        Get.find<PropertyController>();

    // Fetch all properties when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _propertyController.fetchAllProperties();
    });

    return Scaffold(
      drawer: LeftDrawer(),
      appBar: AppBar(
        title: const Text(
          'Immo Manager',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (ctx) {
                  return const Filters();
                },
              );
            },
            icon: const Icon(
              Icons.manage_search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Obx(() {
        if (_propertyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_propertyController.allProperties.isEmpty) {
          return Center(child: Text('No properties found'));
        }

        return RefreshIndicator(
          onRefresh: () async {
            await _propertyController.fetchAllProperties();
          },
          child: ListView.builder(
            itemCount: _propertyController.allProperties.length,
            itemBuilder: (context, index) {
              final property = _propertyController.allProperties[index];
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
          ),
        );
      }),
    );
  }
}
