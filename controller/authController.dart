import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:immo_manager/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var user = Rxn<User>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserFromLocalStorage();
  }

  Future<http.Response> register(
      String name, String email, String password, String phone) async {
    isLoading.value = true;
    var body = jsonEncode({
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    });

    const url = 'http://localhost:8080/user';

    var headers = {
      'Content-Type': 'application/json',
    };

    try {
      var request = http.Request('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.body = body;

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);

        user.value = User(
          id: data['id'],
          email: data['email'],
          name: data['name'],
          phone: data['phone'],
          admin: data['admin'],
        );

        await _saveUserToLocalStorage(user.value!);
        Get.snackbar('Welcome', '${data['name']}');
        Get.offAllNamed('/');
      } else {
        Get.snackbar('Error', 'Failed to register');
      }

      return response;
    } catch (e) {
      Get.snackbar('Error', e.toString());

      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    const url = 'http://localhost:8080/user/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        user.value = User(
          id: data['id'],
          email: data['email'],
          name: data['name'],
          phone: data['phone'],
          admin: data['admin'],
        );

        await _saveUserToLocalStorage(user.value!);
        Get.snackbar('Welcome', "${data['name']}");
        Get.offAllNamed('/');
      } else {
        Get.snackbar('Error', 'Failed to login');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void signOut() async {
    user.value = null;
    Get.offAllNamed('/login');

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  bool isLoggedIn() {
    return user.value != null;
  }

  Future<void> _saveUserToLocalStorage(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

  void _loadUserFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user');
    if (userData != null) {
      user.value = User.fromJson(jsonDecode(userData));
      // Notify the UI to update
      update();
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/login');
    }
  }
}
