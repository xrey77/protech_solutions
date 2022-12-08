class User1 {
  final int id;
  final String name;
  final String role;
  final String token;
  final String userpic;

  User1(
      {required this.id,
      required this.name,
      required this.role,
      required this.token,
      required this.userpic});

  User1.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        role = json['role'],
        token = json['token'],
        userpic = json['userpic'];

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'role': role,
  //       'token': token,
  //       'userpic': userpic
  //     };

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user1 = <String, dynamic>{};
    user1["id"] = id;
    user1["name"] = name;
    user1["role"] = role;
    user1["userpic"] = userpic;
    return user1;
  }
}
