import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:protech_solutions/navbar.dart';
import 'navbar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Protech Corporations",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        endDrawer: const NavBar(),
        appBar: AppBar(
          leading: Image.asset("assets/images/protech.png"),
          title: const Text(
            'Management Information System',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // actions: [],
          centerTitle: false,
        ),
        body: const Center(
          child: Text(
            "Contact Us",
            style: TextStyle(fontSize: 44),
          ),
        ),
      ),
    );
  }
}
