import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/propertyController.dart';

class AddPropertiesScreen extends StatelessWidget {
  AddPropertiesScreen({super.key});
  final PropertyController propertyController = Get.put(PropertyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Ajouter une propriété',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _inputField("name", propertyController.nameController),
                const SizedBox(height: 20),
                _inputField(
                    "description", propertyController.descriptionController),
                const SizedBox(height: 20),
                _inputField("details", propertyController.detailsController),
                const SizedBox(height: 20),
                _inputField("sizes", propertyController.sizesController),
                const SizedBox(height: 20),
                _inputField("location", propertyController.locationController),
                const SizedBox(height: 20),
                _inputField("price", propertyController.priceController),
                const SizedBox(height: 20),
                _inputField(
                    "equipment", propertyController.equipmentController),
                const SizedBox(height: 20),
                _dropdownField(propertyController),
                const SizedBox(height: 20),
                Obx(() {
                  return propertyController.isLoading.value
                      ? const CircularProgressIndicator()
                      : _submitBtn(propertyController);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.blue),
    );

    return TextField(
      style: const TextStyle(color: Colors.blue),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.blue),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _dropdownField(PropertyController controller) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.blue),
    );

    return Obx(() {
      return DropdownButtonFormField<DropdownItem>(
        value: controller.selectedItem.value,
        onChanged: (DropdownItem? newValue) {
          controller.selectedItem.value = newValue!;
        },
        items: DropdownItem.values.map((DropdownItem item) {
          return DropdownMenuItem<DropdownItem>(
            value: item,
            child: Text(item.toString().split('.').last),
          );
        }).toList(),
        decoration: InputDecoration(
          hintText: 'Select an item',
          hintStyle: const TextStyle(color: Colors.blue),
          enabledBorder: border,
          focusedBorder: border,
        ),
        style: const TextStyle(color: Colors.blue),
      );
    });
  }

  Widget _submitBtn(PropertyController controller) {
    return OutlinedButton(
      onPressed: () {
        controller.postData();
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: const BorderSide(color: Colors.blue, width: 1),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          'Submit',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}
