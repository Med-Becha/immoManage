import 'package:flutter/material.dart';
import 'package:immo_manage/screens/Home_screen.dart';
import 'package:immo_manage/screens/Signin_screen.dart';
import 'package:immo_manage/screens/login_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // gettings argument passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case "/signin":
        return MaterialPageRoute(builder: (_) => Signinscreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
