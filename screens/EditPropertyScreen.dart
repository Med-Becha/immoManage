import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/propertyController.dart'; // Import your PropertyController
import 'package:immo_manager/models/propertyModel.dart'; // Import your Property model

class EditPropertyScreen extends StatefulWidget {
  final Property property;

  const EditPropertyScreen({super.key, required this.property});

  @override
  _EditPropertyScreenState createState() => _EditPropertyScreenState();
}

class _EditPropertyScreenState extends State<EditPropertyScreen> {
  final PropertyController _propertyController = Get.find<PropertyController>();

  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _sizesController;
  late TextEditingController _descriptionController;
  late TextEditingController _detailsController;
  late TextEditingController _priceController;
  late TextEditingController _equipmentController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.property.name);
    _locationController = TextEditingController(text: widget.property.location);
    _sizesController = TextEditingController(text: widget.property.sizes);
    _descriptionController =
        TextEditingController(text: widget.property.description);
    _detailsController = TextEditingController(text: widget.property.details);
    _priceController =
        TextEditingController(text: widget.property.price.toString());
    _equipmentController =
        TextEditingController(text: widget.property.equipment);

    // Set the selected item in the dropdown based on the current status
    _propertyController.selectedItem.value = DropdownItem.values.firstWhere(
      (e) => e.toString().split('.').last == widget.property.status,
      orElse: () => DropdownItem.disponibles,
    );
  }

  Future<void> _updateProperty() async {
    final updatedProperty = Property(
        id: widget.property.id,
        name: _nameController.text,
        location: _locationController.text,
        sizes: _sizesController.text,
        status:
            _propertyController.selectedItem.value.toString().split('.').last,
        description: _descriptionController.text,
        details: _detailsController.text,
        equipment: _equipmentController.text,
        price: _priceController.text
        // Ensure price is a double
        );

    await _propertyController.patchProperty(
        updatedProperty.id, updatedProperty);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _sizesController.dispose();
    _descriptionController.dispose();
    _detailsController.dispose();
    _priceController.dispose();
    _equipmentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Property'),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _updateProperty,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _sizesController,
              decoration: const InputDecoration(labelText: 'Sizes'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _detailsController,
              decoration: const InputDecoration(labelText: 'Details'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _equipmentController,
              decoration: const InputDecoration(labelText: 'Equipment'),
            ),
            DropdownButton<DropdownItem>(
              value: _propertyController.selectedItem.value,
              onChanged: (DropdownItem? newValue) {
                if (newValue != null) {
                  setState(() {
                    _propertyController.selectedItem.value = newValue;
                  });
                }
              },
              items: DropdownItem.values.map((DropdownItem item) {
                return DropdownMenuItem<DropdownItem>(
                  value: item,
                  child: Text(item.toString().split('.').last),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
