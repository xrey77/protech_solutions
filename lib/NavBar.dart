import 'package:flutter/material.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:get_it/get_it.dart';
// import 'package:protech_solutions/locator.dart';
import 'aboutus.dart';
// import 'getsession.dart';
import 'login.dart';
import 'signup.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, appUsername}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              title: const Text("About Us"),
              // ignore: avoid_print
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Aboutus()),
                );
              }),
          ExpansionTile(
            title: const Text("Services"),
            leading: const Icon(Icons.keyboard_command_key_sharp), //add icon
            childrenPadding: const EdgeInsets.only(left: 60), //children padding
            children: [
              ListTile(
                title: const Text("ATM Monitoring 24/7"),
                onTap: () {
                  //action on press
                },
              ),

              ListTile(
                title: const Text("Bank Software Solutions"),
                onTap: () {
                  //action on press
                },
              ),
              ListTile(
                title: const Text("ATM parts replacement"),
                onTap: () {
                  //action on press
                },
              ),
              ListTile(
                title: const Text("Field Services Maintenance"),
                onTap: () {
                  //action on press
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
                  //action on press
                },
              ),

              ListTile(
                title: const Text("Automated Teller Safes"),
                onTap: () {
                  //action on press
                },
              ),

              //more child menu
            ],
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text("Contact Us"),
            // ignore: avoid_print
            onTap: () => print("contact us.."),
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share"),
            // ignore: avoid_print
            onTap: () => print("Share"),
          ),
          ListTile(
            leading: const Icon(Icons.person_pin),
            title: const Text("Sign-In"),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );

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
              // await SessionManager().destroy();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}



// xgetSession() {
//   String xname = "";
//   try {
//     dynamic uname = SessionManager().get("USERNAME");
//     xname = uname.toString();
//   } catch (e) {
//     xname = "Error";
//   }

//   return xname;
// }
