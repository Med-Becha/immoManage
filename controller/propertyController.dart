import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:immo_manager/controller/authController.dart';
import 'package:immo_manager/models/propertyModel.dart';
import 'package:immo_manager/widgets/imagesModal.dart';

enum DropdownItem { disponibles, occupees, maintenance }

class PropertyController extends GetxController {
  var userProperties = <Property>[].obs;
  var allProperties = <Property>[].obs;
  var isLoading = false.obs;

  final AuthController authController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController sizesController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController equipmentController = TextEditingController();
  var selectedItem = DropdownItem.disponibles.obs;

  // Add property
  Future<void> postData() async {
    isLoading.value = true;

    try {
      final user = authController.user.value;
      final response = await http.post(
        Uri.parse(
            'http://localhost:8080/property/user/${user?.id ?? "undefined"}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': nameController.text,
          'description': descriptionController.text,
          'details': detailsController.text,
          'sizes': sizesController.text,
          'location': locationController.text,
          'price': priceController.text,
          'equipment': equipmentController.text,
          'status': selectedItem.value.toString().split('.').last,
        }),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final Property createdProperty = Property.fromJson(jsonResponse);
        Get.dialog(ImageUploadModal(property: createdProperty));
        Get.snackbar('Success', 'Property added successfully');
      } else {
        Get.snackbar('Error', 'Failed to add property: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch user properties
  Future<void> fetchUserProperties() async {
    isLoading.value = true;

    try {
      final user = authController.user.value;
      final response = await http.get(
        Uri.parse(
            'http://localhost:8080/property/userproperties/${user?.id ?? "undefined"}'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        final List<Property> properties =
            jsonResponse.map((json) => Property.fromJson(json)).toList();
        userProperties.value = properties;
      } else {
        Get.snackbar(
            'Error', 'Failed to fetch user properties: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch all properties
  Future<void> fetchAllProperties() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/property/all'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        allProperties.value =
            jsonResponse.map((data) => Property.fromJson(data)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch properties: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  // Delete a property by id
  Future<void> deleteProperty(int id) async {
    isLoading.value = true;

    try {
      final response = await http.delete(
        Uri.parse('http://localhost:8080/property/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        userProperties.removeWhere((property) => property.id == id);
        allProperties.removeWhere((property) => property.id == id);
        Get.snackbar('Success', 'Property deleted successfully');
      } else {
        Get.snackbar('Error', 'Failed to delete property: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  // Patch a property
  Future<void> patchProperty(int id, Property updatedProperty) async {
    isLoading.value = true;

    try {
      final Map<String, dynamic> patchData = {
        'name': updatedProperty.name,
        'description': updatedProperty.description,
        'details': updatedProperty.details,
        'sizes': updatedProperty.sizes,
        'location': updatedProperty.location,
        'price': updatedProperty.price,
        'equipment': updatedProperty.equipment,
        'status': updatedProperty.status,
      };

      final response = await http.patch(
        Uri.parse('http://localhost:8080/property/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(patchData),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', response.body);
        await fetchUserProperties();
        await fetchAllProperties();
        // Navigate back to the previous screen
        Get.back();
      } else {
        Get.snackbar('Error', 'Failed to update property: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
