import 'package:flutter/material.dart';

class ATMParts extends StatelessWidget {
  const ATMParts({Key? key}) : super(key: key);

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
            "ATM Parts Replacement",
            style: TextStyle(fontSize: 44),
          ),
        ),
      ),
    );
  }
}
