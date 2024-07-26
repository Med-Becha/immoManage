import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/tenantsController.dart';
import 'package:immo_manager/models/tenantModel.dart';

class EditTenantScreen extends StatelessWidget {
  final Tenant tenant;

  const EditTenantScreen({super.key, required this.tenant});

  @override
  Widget build(BuildContext context) {
    final TenantController tenantController = Get.find<TenantController>();
    final nameController = TextEditingController(text: tenant.name);
    final emailController = TextEditingController(text: tenant.email);
    final phoneController = TextEditingController(text: tenant.phone);
    final cinController = TextEditingController(text: tenant.cin);
    final addressController = TextEditingController(text: tenant.address);
    final jobController = TextEditingController(text: tenant.job);
    final budgetController = TextEditingController(text: tenant.budget);
    final remarkController = TextEditingController(text: tenant.remark ?? '');

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Edit Tenant",
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
                tenantController.updateTenant(
                  tenant.id!,
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
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
