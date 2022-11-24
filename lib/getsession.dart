import 'package:flutter_session_manager/flutter_session_manager.dart';

class GetsSession {
  // static Future<dynamic> getSessions() async {
  //   dynamic xname = await SessionManager().get("USERNAME");
  //   return xname;
  // }
  static dynamic uname;
  GetsSession() {
    uname = SessionManager().get("USERNAME");
  }
}
