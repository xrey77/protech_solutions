import 'package:flutter/material.dart';

class FieldServices extends StatelessWidget {
  const FieldServices({Key? key}) : super(key: key);

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
        body: const Center(
          child: Text(
            "Field Services Maintenance",
            style: TextStyle(fontSize: 44),
          ),
        ),
      ),
    );
  }
}
