import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

alertIOSMesage(BuildContext context, String msg) {
  var alert = CupertinoAlertDialog(
    title: const Text("Alert Message \n"),
    content: Text(msg),
    actions: [
      CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop("Discard");
          },
          child: const Text('Ok')),
    ],
  );

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

alertANDROIDMesage(BuildContext context, String msg) {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14));

  var alert = AlertDialog(
      title: const Text("Alert Message \n"),
      content: Text(msg),
      actions: <Widget>[
        ElevatedButton(
          style: style,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop("Discard");
          },
          child: const Text('Ok'),
        ),
      ]);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
