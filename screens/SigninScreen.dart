import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/authController.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwrodController = TextEditingController();
  TextEditingController confirmPasswrodController = TextEditingController();

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _page()),
    );
  }

  Widget _page() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            _icon(),
            const SizedBox(
              height: 50,
            ),
            _inputField("e-mail", mailController),
            const SizedBox(
              height: 15,
            ),
            _inputField("nom et prenom", fullNameController),
            const SizedBox(
              height: 15,
            ),
            _inputField("Phone", phoneController),
            const SizedBox(
              height: 15,
            ),
            _inputField("mot de passe", passwrodController, isPassword: true),
            const SizedBox(
              height: 15,
            ),
            _inputField(
              "Confirmer le mot de password",
              confirmPasswrodController,
              isPassword: true,
            ),
            const SizedBox(
              height: 25,
            ),
            _signinBtn(),
            const SizedBox(
              height: 25,
            ),
            _loginText()
          ],
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

  Widget _signinBtn() {
    return OutlinedButton(
      onPressed: () {
        final email = mailController.text;
        final fullName = fullNameController.text;
        final password = passwrodController.text;
        final phone = phoneController.text;

        final confirmPassword = confirmPasswrodController.text;

        if (password != confirmPassword) {
          Get.snackbar('Error', 'Passwords do not match');
          return;
        }

        authController.register(fullName, email, password, phone);
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: const BorderSide(color: Colors.blue, width: 1),
      ),
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

  Widget _loginText() {
    return TextButton(
      child: const Text(
        "Don't have an account ? Sign Up",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.blue),
      ),
      onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
    );
  }
}
