import 'dart:ui';
// ignore: unused_import
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:protech_solutions/locator.dart';
import 'navbar.dart';
import 'sliders.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

String _userName = "";

void main() {
  setup();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'Protech Corporation';
    // dynamic xName = getSessionz();

    // try {
    //   if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    //     DesktopWindow.setFullScreen(true);
    //   }
    // } catch (e) {
    //   // ignore: avoid_print
    //   print(e);
    // }
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
        endDrawer: const NavBar(appUsername: ""),
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
                  child: Sliders(),
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

void clearSession() async {
  await SessionManager().destroy();
}

Future<void> getSessionz() async {
  dynamic xname = await SessionManager().get("USERNAME");
  _userName = xname;
}
