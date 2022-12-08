import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:protech_solutions/aboutus.dart';
import 'package:protech_solutions/contactus.dart';
// import 'package:protech_solutions/getsession.dart';
import 'package:protech_solutions/products/automated_teller.dart';
import 'package:protech_solutions/products/self_service.dart';
import 'package:protech_solutions/services/atm_monitoring.dart';
import 'package:protech_solutions/services/atm_parts.dart';
import 'package:protech_solutions/services/bank_software.dart';
import 'package:protech_solutions/services/field_services.dart';
import 'package:protech_solutions/share.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:get_it/get_it.dart';
// import 'package:protech_solutions/locator.dart';
// import 'getsession.dart';
import 'login.dart';
import 'main.dart';
import 'signup.dart';

String userName = "";
List userX = [];

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // late String xName = "";

  @override
  void initState() {
    super.initState();
    // print(xName);
    Future<void> getSession() async {
      try {
        var res = await SessionManager().get("USERNAME");
        userX.add({"username": res});
        userName = "";
        setState(() {
          userName = res;
        });
      } catch (e) {}
    }

    getSession();
  }

  @override
  Widget build(BuildContext context) {
    // print("Username 2 A : " + userName);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, //REMOVE WHITE SPACE AT THE TOP
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              userName,
              style: const TextStyle(color: Colors.white),
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
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => App()));
              }),
          ListTile(
              leading: const Icon(Icons.info_sharp),
              title: const Text("About Us"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutusPage()));
              }),
          ExpansionTile(
            title: const Text("Services"),
            leading: const Icon(Icons.keyboard_command_key_sharp), //add icon
            childrenPadding: const EdgeInsets.only(left: 60), //children padding
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
            leading: const Icon(Icons.production_quantity_limits), //add icon
            childrenPadding: const EdgeInsets.only(left: 60), //children padding
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ContactUs()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share"),
            // ignore: avoid_print
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SharePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_pin),
            title: const Text("Sign-In"),
            onTap: () async {
              await loginDialog(context);
              // await Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => const LoginPage()),
              // );

              // await modalDialog(context);
            },
          ),
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
              await SessionManager().destroy();
              userName = "";
              Navigator.pop(context);
              window.close();
            },
          ),
        ],
      ),
    );
  }
}

void clearSession() async {
  await SessionManager().destroy();
}
