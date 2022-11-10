import 'dart:html';

import 'package:flutter/material.dart';
import 'NavBar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'Protech Solutions';

    final PageController ctrl = PageController(
      viewportFraction: 1.0,
    );

    List<String> carousel = [
      "assets/images/x1.png",
      "assets/images/x2.png",
      "assets/images/x3.png",
      "assets/images/x4.png"
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        endDrawer: const NavBar(),
        appBar: AppBar(
          leading: Image.asset("assets/images/protech.png"),
          title: const Text('Protech Solutions'),
          // actions: [],
          centerTitle: false,
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: PageView.builder(
                    controller: ctrl,
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                    pageSnapping: true,
                    itemBuilder: (context, pagePosition) {
                      return Container(
                        padding: EdgeInsets.zero,
                        // margin: const EdgeInsets.all(0),
                        child: Image.asset(carousel[pagePosition],
                            fit: BoxFit.fill),
                      );
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "   Copyright © 2022 - 2030, All rights ® reserved, Proech Solutions...",
                        style: TextStyle(fontSize: 11),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
