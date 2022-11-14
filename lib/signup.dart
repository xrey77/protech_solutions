import 'package:flutter/material.dart';
// import 'dart:html';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// import 'package:protech_solutions/main.dart';
import 'dart:convert';
import 'utility.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';

final lastnameController = TextEditingController();
final firstnameController = TextEditingController();
final emailaddressController = TextEditingController();
final mobilenoController = TextEditingController();
final usernameController = TextEditingController();
final passwordController = TextEditingController();

userRegistration(context) {
  AwesomeDialog(
    context: context,
    width: 600.0,
    animType: AnimType.scale,
    dialogType: DialogType.success,
    autoDismiss: true,
    // onDismissCallback: (type) {
    //   print('onDismissCallback');
    //   Navigator.of(context).pop(type);
    // },
    keyboardAware: true,
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            'Create an Account',
            style: Theme.of(context).textTheme.headline6,
          ),
          //=========LAST NAME ===========
          const SizedBox(
            height: 10,
          ),
          Material(
            elevation: 0,
            color: Colors.blueGrey.withAlpha(40),
            child: TextFormField(
              autofocus: true,
              minLines: 1,
              controller: lastnameController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Last Name',
                prefixIcon: Icon(Icons.person_pin_circle),
              ),
            ),
          ),
          //==========FIRST NAME================
          const SizedBox(
            height: 10,
          ),
          Material(
            elevation: 0,
            color: Colors.blueGrey.withAlpha(40),
            child: TextFormField(
              autofocus: true,
              minLines: 1,
              controller: firstnameController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'First Name',
                prefixIcon: Icon(Icons.sunny),
              ),
            ),
          ),
          //=============EMAIL ADDRESS ================
          const SizedBox(
            height: 10,
          ),
          Material(
            elevation: 0,
            color: Colors.blueGrey.withAlpha(40),
            child: TextFormField(
              autofocus: true,
              minLines: 1,
              controller: emailaddressController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          //=======MOBILE PHONE==========
          const SizedBox(
            height: 10,
          ),
          Material(
            elevation: 0,
            color: Colors.blueGrey.withAlpha(40),
            child: TextFormField(
              autofocus: true,
              minLines: 1,
              controller: mobilenoController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Mobile Phone',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
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
              controller: usernameController,
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
              controller: passwordController,
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
              submitLoginData(
                  context,
                  lastnameController.text,
                  firstnameController.text,
                  emailaddressController.text,
                  mobilenoController.text,
                  usernameController.text,
                  passwordController.text);
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
              Navigator.pop(context, true);
            },
          )
        ],
      ),
    ),
  ).show();
}

submitLoginData(context, String lname, String fname, String emailadd,
    String mobile, String usrname, String passwd) async {
  var client = http.Client();
  try {
    final url = Uri.parse("http://localhost:5100/api/user/signup");
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'lastname': lname,
      'firstname': fname,
      'emailadd': emailadd,
      'mobileno': mobile,
      'username': usrname,
      'passwd': passwd,
    };
    String jsonbody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    Response response = await client.post(url,
        headers: headers, body: jsonbody, encoding: encoding);
    int statuscode = response.statusCode;
    Map<String, dynamic> responseJson = json.decode(response.body);
    if (statuscode == 200) {
      var session = FlutterSession();
      await session.set("ID", responseJson['userid']);
      await session.set("FULLNAME", responseJson['full_name']);
      await session.set("USERNAME", responseJson['username']);
      await session.set("EMAIL", responseJson['email']);
      await session.set("MOBILENO", responseJson['mobile_no']);
      await session.set("TOKEN", responseJson['token']);
      alertMesage(context, "You have successfully logged-in to your account.");
    } else {
      alertMesage(context, responseJson[statuscode].toString());
    }
  } on Exception catch (ex) {
    alertMesage(context, ex.toString());
  } finally {
    client.close();
  }
}
