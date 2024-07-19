import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/authController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(() => _page())),
    );
  }

  Widget _page() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(),
              const SizedBox(
                height: 50,
              ),
              _inputField("Login", emailController),
              const SizedBox(
                height: 20,
              ),
              _inputField("Password", passwordController, isPassword: true),
              const SizedBox(
                height: 50,
              ),
              _loginBtn(),
              const SizedBox(
                height: 50,
              ),
              _loginText()
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.blue, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
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
          focusedBorder: border),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return authController.isLoading.value
        ? const CircularProgressIndicator()
        : OutlinedButton(
            onPressed: () {
              authController.login(
                emailController.text,
                passwordController.text,
              );
            },
            style: OutlinedButton.styleFrom(
                // shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: Colors.blue, width: 1)),
            child: const SizedBox(
              width: double.infinity,
              child: Text(
                'Sign in',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
          );
  }

// redirect to sign in screen
  Widget _loginText() {
    return TextButton(
      child: const Text(
        "Don't have an account ? Sign Up",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.blue),
      ),
      onPressed: () => Navigator.of(context).pushReplacementNamed('/signin'),
    );
  }
}
