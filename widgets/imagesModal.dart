import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:immo_manager/models/propertyModel.dart';

class ImageUploadModal extends StatefulWidget {
  final Property property;

  ImageUploadModal({required this.property});

  @override
  _ImageUploadModalState createState() => _ImageUploadModalState();
}

class _ImageUploadModalState extends State<ImageUploadModal> {
  List<Uint8List> _selectedImages = [];
  var isUploading = false.obs;

  Future<void> _pickImages() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _selectedImages = result.files.map((file) => file.bytes!).toList();
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick images: ${e.toString()}');
    }
  }

  Future<void> _uploadImages() async {
    if (_selectedImages.isEmpty) {
      Get.snackbar('Info', 'No images selected');
      return;
    }

    isUploading.value = true;

    try {
      final uri =
          Uri.parse('http://localhost:8080/images/${widget.property.id}');
      var request = http.MultipartRequest('POST', uri);

      // Adding the property ID to the request
      request.fields['propertyId'] = widget.property.id.toString();

      // Adding files to the request
      for (var imageData in _selectedImages) {
        request.files.add(http.MultipartFile.fromBytes(
          'file', // Ensure this field name matches the server's expectation
          imageData,
          filename:
              'image_${DateTime.now().millisecondsSinceEpoch}.jpg', // Use unique names for each file
        ));
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Images uploaded successfully');
        Navigator.of(context).pop(); // Close the modal
      } else {
        final responseBody = await response.stream.bytesToString();
        Get.snackbar('Error', 'Failed to upload images: ${responseBody}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: ${e.toString()}');
    } finally {
      isUploading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Upload images for ${widget.property.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImages,
              child: Text('Pick Images'),
            ),
            SizedBox(height: 20),
            _selectedImages.isNotEmpty
                ? Column(
                    children: _selectedImages.map((imageData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Image.memory(imageData, height: 100),
                      );
                    }).toList(),
                  )
                : Text('No images selected'),
            SizedBox(height: 20),
            Obx(() => isUploading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _uploadImages,
                    child: Text('Upload Images'),
                  )),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the modal
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
