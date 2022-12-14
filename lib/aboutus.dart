import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:protech_solutions/navbar.dart';
import 'navbar.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Protech Corporations",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          leading: Image.asset("assets/images/protech.png"),
          title: const Text(
            'Management Information System',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // actions: [],
          centerTitle: false,
        ),
        endDrawer: const NavBar(),
        body: const Center(
          child: Text(
            "About Us",
            style: TextStyle(fontSize: 44),
          ),
        ),
      ),
    );
  }
}
