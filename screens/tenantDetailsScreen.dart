import 'package:flutter/material.dart';
import 'package:immo_manager/models/tenantModel.dart'; // Adjust the import path if needed
import 'package:get/get.dart';
import 'package:immo_manager/screens/editTenantScreen.dart'; // Adjust the import path if needed

class TenantDetailsScreen extends StatelessWidget {
  final Tenant tenant;

  const TenantDetailsScreen({super.key, required this.tenant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Tenant Details",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Get.to(() => EditTenantScreen(tenant: tenant));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${tenant.name}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("Email: ${tenant.email}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("Phone: ${tenant.phone}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("adress: ${tenant.address}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("budget: ${tenant.budget}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("cin: ${tenant.cin}", style: const TextStyle(fontSize: 18)),
            // Add more details as needed
            const SizedBox(height: 8),
            Text("travail: ${tenant.job}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("remark: ${tenant.remark}",
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
