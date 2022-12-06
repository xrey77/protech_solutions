import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'dart:html';
// import ‘package:flutter/foundation.dart’;
import 'dart:io' show Platform;
// import 'dart:ui';
// import 'dart:core';
// import 'package:desktop_window/desktop_window.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:protech_solutions/main.dart';
// import 'package:protech_solutions/navbar.dart';
// import 'package:protech_solutions/navbar.dart';
// import 'package:http/http.dart';
// import 'package:protech_solutions/signup.dart';
// import 'models/userlogin.dart';
import 'utility.dart';
// import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:flutter/scheduler.dart';

final usrController = TextEditingController();
final pwdController = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Protech Corporation",
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
          body: Container(
            margin: const EdgeInsets.only(
                left: 200, top: 150, right: 200, bottom: 0),
            child: Column(
              children: <Widget>[
                Text(
                  'Login to your Account',
                  style: Theme.of(context).textTheme.headline6,
                ),
                //=========USERNAME===================
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    autofocus: true,
                    minLines: 1,
                    controller: usrController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                //=========PASSWORD ==================
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    obscureText: true,
                    autofocus: true,
                    controller: pwdController,
                    // keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                //=============SUBMIT BUTTON==================
                const SizedBox(
                  height: 10,
                ),

                AnimatedButton(
                  isFixedHeight: false,
                  text: 'Submit',
                  pressEvent: () {
                    submitHttpLogindata(
                        context, usrController.text, pwdController.text);
                    // Navigator.push(context,MaterialPageRoute(
                    //     builder: (_) => const App(
                    //       passedColor: Colors.pink,
                    //       passedColorName: 'Pink',
                    //     ),),);},

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const MainApp(appUsername: '')),
                    // );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                //============CLOSE BUTTON=================
                AnimatedButton(
                  isFixedHeight: false,
                  color: Colors.green,
                  text: 'Close',
                  pressEvent: () {
                    // Navigator.pop(context, true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => App()),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}

// modalDialog(BuildContext context) async {
//   return await AwesomeDialog(
//     context: context,
//     width: 600.0,
//     animType: AnimType.scale,
//     dialogType: DialogType.question,
//     keyboardAware: true,
//     body: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: <Widget>[
//           Text(
//             'Login to your Account',
//             style: Theme.of(context).textTheme.headline6,
//           ),
//           //=========USERNAME===================
//           const SizedBox(
//             height: 10,
//           ),
//           Material(
//             elevation: 0,
//             color: Colors.blueGrey.withAlpha(40),
//             child: TextFormField(
//               autofocus: true,
//               minLines: 1,
//               controller: usrController,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//                 labelText: 'Username',
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//           ),
//           //=========PASSWORD ==================
//           const SizedBox(
//             height: 10,
//           ),
//           Material(
//             elevation: 0,
//             color: Colors.blueGrey.withAlpha(40),
//             child: TextFormField(
//               obscureText: true,
//               autofocus: true,
//               controller: pwdController,
//               // keyboardType: TextInputType.text,
//               minLines: 1,
//               maxLines: 1,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//                 labelText: 'Password',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//           ),
//           //=============SUBMIT BUTTON==================
//           const SizedBox(
//             height: 10,
//           ),

//           AnimatedButton(
//             isFixedHeight: false,
//             text: 'Submit',
//             pressEvent: () {
//               submitLogindata(context, usrController.text, pwdController.text);
//               // Navigator.pop(context);
//             },
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           //============CLOSE BUTTON=================
//           AnimatedButton(
//             isFixedHeight: false,
//             color: Colors.green,
//             text: 'Close',
//             pressEvent: () {
//               Navigator.pop(context, true);
//             },
//           )
//         ],
//       ),
//     ),
//   ).show();
// }

submitHttpLogindata(context, String usr, String pwd) async {
  var client = http.Client();
  try {
    final url = Uri.parse('http://localhost:9000/user/login');

    final hdrs = {'Content-Type': 'application/json'};

    Map<String, dynamic> data = {
      'username': usr,
      'password': pwd,
    };
    final jsonbody = jsonEncode(data);
    final encoding = Encoding.getByName('utf-8');

    final response = await client.post(url,
        headers: hdrs, body: jsonbody, encoding: encoding);
    final HttpSession s;

    var statuscode = response.statusCode;
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    if (statuscode == 200) {
      var sessionManager = SessionManager();

      await sessionManager.remove("USERID");
      await sessionManager.remove("USERNAME");
      await sessionManager.remove("ROLE");
      await sessionManager.remove("TOKEN");
      await sessionManager.remove("USERPIC");

      await sessionManager.set("USERID", responseJson['id']);
      await sessionManager.set("USERNAME", responseJson['username']);
      await sessionManager.set("ROLE", responseJson['role']);
      await sessionManager.set("TOKEN", responseJson['token']);
      await sessionManager.set("USERPIC", responseJson['userpicture']);

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => App()),
      );
      await sessionManager.update();
      okMsg(context);
    } else {
      int? code = statuscode;
      errMsg(context, code);
    }
    // ignore: empty_catches
  } catch (ex) {}
}

void submitDioLogindata(context, String usrname, String pwd) async {
  var dio = Dio();
  try {
    dio.options.headers['content-Type'] = 'application/json;charset=UTF-8';

    Response response = await dio.post('http://localhost:9000/user/login',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8",
        }),
        data: {'username': usrname, 'password': pwd});

    if (response.statusCode == 200) {
      okMsg(context);
      Navigator.pop(context, true);
    }
  } on DioError catch (e) {
    int? code = e.response?.statusCode;
    errMsg(context, code);
  }
}

okMsg(context) {
  try {
    if (Platform.isIOS || Platform.isMacOS) {
      alertIOSMesage(
          context, "You have successfully logged-in to your account.");
    } else if (Platform.isAndroid) {
      alertANDROIDMesage(
          context, "You have successfully logged-in to your account.");
    }
  } catch (ex) {
    alertIOSMesage(context, "You have successfully logged-in to your account.");
  }
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => const NavBar()),
  // );

  // Navigator.pop(context, true);
}

void errMsg(context, int? code) {
  if (code == 401) {
    try {
      if (Platform.isIOS || Platform.isMacOS) {
        alertIOSMesage(context, "Wrong password.");
      } else if (Platform.isAndroid) {
        alertANDROIDMesage(context, "Wrong password.");
      }
    } catch (ex) {
      alertIOSMesage(context, "Wrong password.");
    }
  } else if (code == 404) {
    try {
      if (Platform.isIOS || Platform.isMacOS) {
        alertIOSMesage(context,
            "Username is not yet registered, please click register link at the top right of the screen.");
      } else if (Platform.isAndroid) {
        alertANDROIDMesage(context,
            "Username is not yet registered, please click register link at the top right of the screen.");
      }
    } catch (ex) {
      alertIOSMesage(context,
          "Username is not yet registered, please click register link at the top right of the screen.");
    }
  } else if (code == 406) {
    try {
      if (Platform.isIOS || Platform.isMacOS) {
        alertIOSMesage(context,
            "You account is not yet activated, please check you Email inbox and click Activate button.");
      } else if (Platform.isAndroid) {
        alertANDROIDMesage(context,
            "You account is not yet activated, please check you Email inbox and click Activate button.");
      }
    } catch (ex) {
      alertIOSMesage(context,
          "You account is not yet activated, please check you Email inbox and click Activate button.");
    }
  }
}
