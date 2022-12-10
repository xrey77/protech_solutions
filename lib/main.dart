// import 'dart:io';
// import 'dart:ui';
// ignore: unused_import
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
// import 'package:protech_solutions/login.dart';
// import 'package:protech_solutions/locator.dart';
// import 'navbar.dart';
// import '.gr.dart';
// import 'aboutus.dart';
// import 'getsession.dart';
// import 'home.dart';
// import 'signin.dart';
// import 'signup.dart';
// import 'carousel.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:protech_solutions/home.dart';
// import 'package:auto_route/auto_route.dart';

void main() {
  // setup();

  runApp(App());
}

class App extends StatelessWidget {
  // const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String appName = 'Protech Corporation';

    // final _appRouter = AppRouter();

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      routes: {"/": (context) => const HomePage()},
    );
  }
}
