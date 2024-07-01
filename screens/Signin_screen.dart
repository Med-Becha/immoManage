import 'package:flutter/material.dart';

class Signinscreen extends StatefulWidget {
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.red],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    );

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: border,
          focusedBorder: border),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint('email  : ' + mailController.text);
        debugPrint(' nom et prenom : ' + fullNameController.text);
        debugPrint(' password1: ' + passwrodController.text);
        debugPrint('password2 : ' + confirmPasswrodController.text);
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          'Sign in',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _loginText() {
    return TextButton(
      child: const Text(
        "Don't have an account ? Sign Up",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      onPressed: () => Navigator.of(context).pushNamed('/login'),
    );
  }
}
