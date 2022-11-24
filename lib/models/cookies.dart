import 'package:flutter_session_manager/flutter_session_manager.dart';

class GetSession {
  GetSession() {}
  dynamic usrname = SessionManager().get("USERNAME");
  // public override string String() {
  //   return String.Format(usrname);
  // }
}
