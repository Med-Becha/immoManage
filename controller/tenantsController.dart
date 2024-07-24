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
        print(response.body);
        List<dynamic> data = json.decode(response.body);
        allTenants.value =
            data.map((tenant) => Tenant.fromJson(tenant)).toList();
      }
    } catch (e) {
      print('Error fetching all tenants: $e');
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
        print('Failed to fetch user tenants: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to fetch user tenants');
      }
    } catch (e) {
      print('Error fetching user tenants: $e');
      Get.snackbar('Error', 'Failed to fetch user tenants');
    }
  }
}
