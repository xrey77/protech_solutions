import 'package:flutter/material.dart';

class BankSoftware extends StatelessWidget {
  const BankSoftware({Key? key}) : super(key: key);

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
            "Bank Software Solutions",
            style: TextStyle(fontSize: 44),
          ),
        ),
      ),
    );
  }
}
