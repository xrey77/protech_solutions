// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:protech_solutions/aboutus.dart';
import 'package:protech_solutions/contactus.dart';
import 'package:protech_solutions/products/automated_teller.dart';
import 'package:protech_solutions/products/self_service.dart';
import 'package:protech_solutions/services/atm_monitoring.dart';
import 'package:protech_solutions/services/atm_parts.dart';
import 'package:protech_solutions/services/bank_software.dart';
import 'package:protech_solutions/services/field_services.dart';
import 'package:protech_solutions/share.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'login.dart';
import 'main.dart';
import 'signup.dart';
import 'package:url_launcher/url_launcher.dart';

String userName = "";
String eMail = "";
String fullName = "";
String userPic = "";

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
    Future<void> getSession() async {
      try {
        var res1 = await SessionManager().get("USERNAME");
        var res2 = await SessionManager().get("EMAIL");
        var res3 = await SessionManager().get("FULLNAME");
        var res4 = await SessionManager().get("USERPIC");

        userName = "";
        eMail = "";
        fullName = "";
        userPic = "";
        setState(() {
          userName = res1;
          eMail = res2;
          fullName = res3;
          userPic = res4;
        });
      } catch (e) {}
    }

    getSession();
  }

  @override
  Widget build(BuildContext context) {
    final Uri mail = Uri(
      scheme: 'mailto',
      path: eMail,
      // query: encodeQueryParameters(<String, String>{
      //   'subject': 'Example Subject & Symbols are allowed!',
      // }),
    );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, //REMOVE WHITE SPACE AT THE TOP
        children: [
          //=====DISPLAY IF USER LOGGED IN========
          UserAccountsDrawerHeader(
            accountName: (userName != "")
                ? Text(
                    fullName,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1)),
                  )
                : const Text(
                    "PROTECH CORPORATION",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(10.0, 10.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )
                      ],
                    ),
                  ),
            accountEmail: (userName != "")
                ? GestureDetector(
                    // TEXT ONTAP EVENT
                    onTap: () {
                      // LAUNCH EMAIL CLIENT
                      launchUrl(mail);
                    },
                    child: MouseRegion(
                        //CHANGE CURSOR POINTER
                        cursor: SystemMouseCursors.grab,
                        //DISPLAY TEXT
                        child: Text(
                          eMail,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 220, 231, 236),
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 2,
                            decorationColor: Colors.white,
                          ),
                        )),
                  )
                // Text(
                //     '{mailto:$eMail}',
                //     style: const TextStyle(color: Colors.white),
                //   )
                : const Text(
                    "PO Box 234324",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
            //IDSPLAY AVATAR====
            currentAccountPicture: (userName != "")
                ? CircleAvatar(
                    child: ClipOval(
                      child: Image.network(userPic, //USER IMAGE
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover),
                    ),
                  )
                //ELSE=====
                : CircleAvatar(
                    // child: ClipRect(
                    backgroundColor: Colors.transparent,
                    child: Image.asset("assets/images/protech.png", //USER IMAGE
                        width: 300,
                        height: 300,
                        fit: BoxFit.fill),
                    // ),
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
            ],
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ContactUs()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SharePage()));
            },
          ),
          //=====SIGN-IN=====
          (userName == "")
              ? ListTile(
                  leading: const Icon(Icons.person_pin),
                  title: const Text("Sign-In"),
                  onTap: () async {
                    await loginDialog(context);
                  })
              : ListTile(
                  leading: const Icon(Icons.person_pin),
                  title: const Text("Sign-Out"),
                  onTap: () async {
                    await SessionManager().destroy();
                    userName = "";
                    Navigator.pop(context);
                    window.close();
                  }),

          //====REGISTER=====
          (userName == "")
              ? ListTile(
                  leading: const Icon(Icons.person_add),
                  title: (userName == "")
                      ? const Text("Register")
                      : const Text(""),
                  onTap: () {
                    userRegistration(context);
                  })
              : const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Quit"),
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
