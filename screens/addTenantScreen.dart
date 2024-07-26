import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/tenantsController.dart';

class AddTenantScreen extends StatelessWidget {
  final TenantController tenantController = Get.find<TenantController>();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final cinController = TextEditingController();
    final addressController = TextEditingController();
    final jobController = TextEditingController();
    final budgetController = TextEditingController();
    final remarkController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Add Tenant",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: cinController,
              decoration: const InputDecoration(labelText: 'CIN'),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: jobController,
              decoration: const InputDecoration(labelText: 'Job'),
            ),
            TextField(
              controller: budgetController,
              decoration: const InputDecoration(labelText: 'Budget'),
            ),
            TextField(
              controller: remarkController,
              decoration: const InputDecoration(labelText: 'Remark'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                tenantController.createTenant(
                  nameController.text,
                  emailController.text,
                  phoneController.text,
                  cinController.text,
                  addressController.text,
                  jobController.text,
                  budgetController.text,
                  remarkController.text,
                );
                Navigator.pop(context);
              },
              child: const Text('Add Tenant'),
            ),
          ],
        ),
      ),
    );
  }
}
