// ignore: file_names
import 'package:flutter/material.dart';

import 'package:immo_manage/widgets/LeftDrawer.dart';
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
        return const Filters();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftDrawer(),
      appBar: AppBar(
        title: const Text(
          'Immo Manager',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the drawer button color here
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: _openFilterShip,
            icon: const Icon(
              Icons.manage_search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) => const Immoitem(
            header: "Immeuble Sedra",
            localisation: "Rte de Tunis 8km Sedra - Sfax",
            label: "S+4",
            imgUrl:
                "https://images.unsplash.com/photo-1570129477492-45c003edd2be?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            occupation: "Disponible",
          ),
        ),
      ),
    );
  }
}
