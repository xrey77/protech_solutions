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
import 'aboutus.dart';
// import 'getsession.dart';
// import 'signin.dart';
import 'signup.dart';
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
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero, //REMOVE WHITE SPACE AT THE TOP
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text(
                  "Reynald",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: const Text(
                  "rey107@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset("assets/images/admin.jpeg", //USER IMAGE
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover),
                  ),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/bg.jpg"), //BACKGROUND OF AVATAR BACKGROUND
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text("Home"),
                  // ignore: avoid_print
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => App()),
                    );
                  }),
              ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text("About Us"),
                  // ignore: avoid_print
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutusPage()),
                    );
                  }),
              ExpansionTile(
                title: const Text("Services"),
                leading:
                    const Icon(Icons.keyboard_command_key_sharp), //add icon
                childrenPadding:
                    const EdgeInsets.only(left: 60), //children padding
                children: [
                  ListTile(
                    title: const Text("ATM Monitoring 24/7"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ATMonitoring()));
                    },
                  ),

                  ListTile(
                    title: const Text("Bank Software Solutions"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BankSoftware()));
                    },
                  ),
                  ListTile(
                    title: const Text("ATM parts replacement"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ATMParts()));
                    },
                  ),
                  ListTile(
                    title: const Text("Field Services Maintenance"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FieldServices()));
                    },
                  ),

                  //more child menu
                ],
              ),
              ExpansionTile(
                title: const Text("Products"),
                leading:
                    const Icon(Icons.production_quantity_limits), //add icon
                childrenPadding:
                    const EdgeInsets.only(left: 60), //children padding
                children: [
                  ListTile(
                    title: const Text("Self Service Terminals"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SelfService()));
                    },
                  ),

                  ListTile(
                    title: const Text("Automated Teller Safes"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AutomatedTeller()));
                    },
                  ),

                  //more child menu
                ],
              ),
              ListTile(
                leading: const Icon(Icons.contact_phone),
                title: const Text("Contact Us"),
                // ignore: avoid_print
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ContactUs()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text("Share"),
                // ignore: avoid_print
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SharePage()));
                },
              ),
              ListTile(
                  leading: const Icon(Icons.person_pin),
                  title: const Text("Sign-In"),
                  onTap: () {
                    Navigator.of(context).pop(false);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  }),
              ListTile(
                  leading: const Icon(Icons.person_add),
                  title: const Text("Register"),
                  onTap: () {
                    userRegistration(context);
                  }),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Exit"),
                onTap: () async {
                  // await SessionManager().destroy();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
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
