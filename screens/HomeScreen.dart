// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:immo_manage/routes/RouteGenerator.dart';
import 'package:immo_manage/utils/LeftDrawer.dart';
import 'package:immo_manage/widgets/Filters.dart';
import 'package:immo_manage/widgets/ImmoItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Filter ship container
  void _openFilterShip() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Filters();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const LeftDrawer(),
        appBar: AppBar(
          title: const Text('Immo Manager'),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: _openFilterShip,
              icon: const Icon(Icons.manage_search),
            )
          ],
        ),
        body: Center(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => const Immoitem(
              header: "title of a house",
            ),
          ),
        ),
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
