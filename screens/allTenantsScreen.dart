import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:immo_manager/controller/tenantsController.dart';
import 'package:immo_manager/models/tenantModel.dart';

class AllTenantsScreen extends StatelessWidget {
  const AllTenantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TenantController tenantController = Get.find<TenantController>();

    // Fetch tenants data when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tenantController.fetchAllTenants();
    });

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Locataires",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (tenantController.allTenants.isEmpty) {
          return const Center(
            child: Text("no tenants "),
          );
        } else {
          return ListView(
            children: _buildList(tenantController.allTenants),
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
            tenant.name, // Use appropriate fallback
            style: const TextStyle(color: Colors.blue),
          ),
          subtitle: Text(
            tenant.email, // Use appropriate fallback
            style: const TextStyle(color: Colors.blue),
          ),
          trailing: const Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
          onTap: () {
            // Handle tap
            print('Tapped on ${tenant.name}');
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
