import 'package:flutter/material.dart';
import 'package:immo_manager/screens/addPropertiesScreen.dart';
import 'package:immo_manager/screens/addTenantScreen.dart';
import 'package:immo_manager/screens/allTenantsScreen.dart';
import 'package:immo_manager/screens/ContractScreen.dart';
import 'package:immo_manager/screens/dashboardScreen.dart';
import 'package:immo_manager/screens/EditProfileScreen.dart';
import 'package:immo_manager/screens/homeScreen.dart';
import 'package:immo_manager/screens/ProfileScreen.dart';
import 'package:immo_manager/screens/SigninScreen.dart';
import 'package:immo_manager/screens/UserPropertiesScreen.dart';
import 'package:immo_manager/screens/loginScreen.dart';
import 'package:immo_manager/screens/userTenantsScreen.dart';

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
      case "/allusers":
        return MaterialPageRoute(builder: (_) => const AllTenantsScreen());
      case "/contracts":
        return MaterialPageRoute(builder: (_) => const ContractScreen());
      case '/addproperties':
        return MaterialPageRoute(builder: (_) => AddPropertiesScreen());
      case "/editprofile":
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case "/usertenants":
        return MaterialPageRoute(builder: (_) => const UserTenantsScreen());
      case "/addtenant":
        return MaterialPageRoute(builder: (_) => AddTenantScreen());
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
