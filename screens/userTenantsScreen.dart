import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/tenantsController.dart';
import 'package:immo_manager/models/tenantModel.dart'; // Adjust the import path if needed
import 'package:immo_manager/screens/tenantDetailsScreen.dart'; // Adjust the import path if needed

class UserTenantsScreen extends StatelessWidget {
  const UserTenantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the TenantController and fetch user tenants when the screen is built
    final TenantController tenantController = Get.find<TenantController>();
    // Fetch user tenants when the screen is opened
    tenantController.fetchUserTenants();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "My Tenants",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/addtenant");
            },
            icon: const Icon(
              Icons.person_add_alt_1_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Obx(() {
        if (tenantController.userTenants.isEmpty) {
          return const Center(child: Text("No tenants found"));
        } else {
          return ListView(
            children: _buildList(tenantController.userTenants),
          );
        }
      }),
    );
  }

  List<Widget> _buildList(List<Tenant> tenants) {
    List<Widget> listTiles = [];

    for (final tenant in tenants) {
      listTiles.add(
        ListTile(
          hoverColor: const Color.fromARGB(78, 3, 168, 244),
          leading: const Icon(
            Icons.person_2_outlined,
            color: Colors.blue,
          ),
          title: Text(
            tenant.name,
            style: const TextStyle(color: Colors.blue),
          ),
          subtitle: Text(
            tenant.email,
            style: const TextStyle(color: Colors.blue),
          ),
          trailing: const Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          onTap: () {
            // Navigate to TenantDetailsScreen
            Get.to(() => TenantDetailsScreen(tenant: tenant));
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
