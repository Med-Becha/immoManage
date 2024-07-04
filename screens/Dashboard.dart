import 'package:flutter/material.dart';
import 'package:immo_manage/widgets/IncomeChart.dart';
import 'package:immo_manage/widgets/PropertiesStatusChart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Tableau de Bord",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          PropertiesStatusChart(),
          const SizedBox(
            height: 20,
          ),
          Incomechart()
        ],
      ),
    );
  }
}
