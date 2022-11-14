import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'utility.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_session/flutter_session.dart';

final usrnameController = TextEditingController();
final passwrdController = TextEditingController();

userLogin(context) {
  AwesomeDialog(
    context: context,
    width: 600.0,
    animType: AnimType.scale,
    dialogType: DialogType.question,
    keyboardAware: true,
    body: Padding(
      padding: const EdgeInsets.all(8.0),
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
              controller: usrnameController,
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
              controller: passwrdController,
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
              submitLogindata(
                  context, usrnameController.text, passwrdController.text);
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

submitLogindata(context, String usr, String pwd) async {
  var client = http.Client();
  try {
    final url = Uri.parse("http://localhost:5100/api/user/signin");
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'username': usr,
      'passwd': pwd,
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
      await session.set("USERNAME", responseJson['usrname']);
      await session.set("ISACTIVATED", responseJson['isactivated']);
      await session.set("EMAILADD", responseJson['emailadd']);
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
