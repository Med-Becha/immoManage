import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:immo_manager/controller/authController.dart';
import 'package:immo_manager/models/tenantModel.dart';
import 'dart:convert';

class TenantController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  var allTenants = <Tenant>[].obs;
  var userTenants = <Tenant>[].obs;

  String get userTenantsUrl {
    final userId = authController.user.value?.id ?? 'undefined';
    return 'http://10.0.2.2:8080/tenant/all/$userId'; // Use appropriate URL
  }

  Future<void> fetchAllTenants() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/tenant/all'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        allTenants.value =
            data.map((tenant) => Tenant.fromJson(tenant)).toList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch all tenants');
    }
  }

  Future<void> fetchUserTenants() async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://localhost:8080/tenant/all/${authController.user.value?.id}'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        userTenants.value =
            data.map((tenant) => Tenant.fromJson(tenant)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch user tenants');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user tenants');
    }
  }

  Future<void> createTenant(
    String name,
    String email,
    String phone,
    String cin,
    String address,
    String job,
    String budget,
    String? remark,
  ) async {
    try {
      final userId = authController.user.value?.id;
      if (userId == null) {
        Get.snackbar('Error', 'User ID is not available');
        return;
      }

      final response = await http.post(
        Uri.parse(
            'http://localhost:8080/tenant/user/$userId'), // Adjusted URL with userId
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'cin': cin,
          'address': address,
          'job': job,
          'budget': budget,
          'remark': remark,
        }),
      );

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Tenant created successfully');
        // Optionally, refetch user tenants or update local state
        await fetchUserTenants();
      } else {
        Get.snackbar('Error', 'Failed to create tenant');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to create tenant');
    }
  }

  Future<void> updateTenant(
    int id,
    String name,
    String email,
    String phone,
    String cin,
    String address,
    String job,
    String budget,
    String? remark,
  ) async {
    try {
      final response = await http.patch(
        Uri.parse('http://localhost:8080/tenant/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'cin': cin,
          'address': address,
          'job': job,
          'budget': budget,
          'remark': remark,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Tenant updated successfully');
        // Optionally, refetch user tenants or update local state
        await fetchUserTenants();
      } else {
        Get.snackbar('Error', 'Failed to update tenant');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update tenant');
    }
  }
}
