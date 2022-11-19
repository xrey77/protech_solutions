class Userlogin {
  int? id;
  String? username;
  String? role;
  String? token;
  String? otp;
  String? userpicture;

  Userlogin(
      {this.id,
      required this.username,
      required this.role,
      required this.token,
      required this.otp,
      required this.userpicture});

  Userlogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    role = json['role'];
    token = json['token'];
    otp = json['otp'];
    userpicture = json['userpicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['role'] = role;
    data['token'] = token;
    data['otp'] = otp;
    data['userpicture'] = userpicture;
    return data;
  }
}
