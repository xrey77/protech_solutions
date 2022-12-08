import 'dart:ui';
// ignore: unused_import
// import 'package:auto_route/auto_route.dart';
// import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:protech_solutions/contactus.dart';
import 'package:protech_solutions/login.dart';
import 'package:protech_solutions/main.dart';
import 'package:protech_solutions/products/automated_teller.dart';
import 'package:protech_solutions/products/self_service.dart';
import 'package:protech_solutions/services/atm_monitoring.dart';
import 'package:protech_solutions/services/atm_parts.dart';
import 'package:protech_solutions/services/bank_software.dart';
import 'package:protech_solutions/services/field_services.dart';
import 'package:protech_solutions/share.dart';
// import 'package:protech_solutions/login.dart';
// import 'package:protech_solutions/locator.dart';
// import 'navbar.dart';
// import 'getsession.dart';
// import 'signin.dart';
import 'navbar.dart';
import 'carousel.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:auto_route/auto_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'Protech Corporation';

    // final _appRouter = AppRouter();

    // dynamic xName = getSessionz();

    // ;
    // xName = _userName as Future<void>;
    // // ignore: avoid_print
    // print(xName);

    return MaterialApp(
      scrollBehavior:
          AppScrollBehavior(), //SET THE SCROLL BEHAVIOR TO MOUSE AND TOUCH SCREEN
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
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
        // ignore: avoid_unnecessary_containers
        body: Container(
          margin: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),

          color: Colors.black,
          // margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                const Flexible(
                  // width: double.infinity,
                  flex: 2,
                  // margin: EdgeInsets.all(0),
                  child: Carousel(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "   Copyright © 2022 - 2030, All rights ® reserved, Protech Corporation ™",
                      style: TextStyle(fontSize: 11, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//SET THE SCROLL BEHAVIOR TO MOUSE AND TOUCH SCREEN
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
