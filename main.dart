import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immo_manager/controller/authController.dart';
import 'package:immo_manager/controller/propertyController.dart';
import 'package:immo_manager/controller/tenantsController.dart';
import 'package:immo_manager/routes/routeGenerator.dart';

void main() {
  Get.put(AuthController());
  Get.put(PropertyController());
  Get.put(TenantController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final bool isLoggedIn = true;
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'immo manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: authController.isLoggedIn() ? "/" : "/login",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
