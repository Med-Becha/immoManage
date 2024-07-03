import 'package:flutter/material.dart';
import 'package:immo_manage/screens/Dashboard.dart';
import 'package:immo_manage/screens/HomeScreen.dart';
import 'package:immo_manage/screens/ProfileScreen.dart';
import 'package:immo_manage/screens/SigninScreen.dart';
import 'package:immo_manage/screens/UserPropertiesScreen.dart';
import 'package:immo_manage/screens/loginScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/login":
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case "/signin":
        return MaterialPageRoute(builder: (_) => const Signinscreen());
      case "/profile":
        return MaterialPageRoute(builder: (_) => const Profilescreen());
      case "/userproperties":
        return MaterialPageRoute(builder: (_) => const UserPropertiesScreen());
      case "/chart":
        return MaterialPageRoute(builder: (_) => const Dashboard());
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
