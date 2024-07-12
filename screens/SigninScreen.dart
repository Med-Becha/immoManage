import 'package:flutter/material.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Signinscreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwrodController = TextEditingController();
  TextEditingController confirmPasswrodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(child: _page()),
      ),
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
            _loginBtn(),
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

  Widget _loginBtn() {
    return OutlinedButton(
      onPressed: () {
        debugPrint('email  : ${mailController.text}');
        debugPrint(' nom et prenom : ${fullNameController.text}');
        debugPrint(' password1: ${passwrodController.text}');
        debugPrint('password2 : ${confirmPasswrodController.text}');
        Navigator.of(context).pushReplacementNamed("/");
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
