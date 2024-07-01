import 'package:flutter/material.dart';
import 'package:immo_manage/utils/LeftDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: LeftDrawer(),
        appBar: AppBar(
          title: const Text('Immo Manager'),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text("Main page"),
        ),
      ),
    );
  }
}
