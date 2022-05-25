import 'dart:convert';

User userModelFromJson(String str) => User.fromJson(jsonDecode(str));
String userModelToJson(User u) => json.encode(u.toJson());

class User {
  String? username;
  String? password;
  String? email;
  String? address;
  String? firstname;
  String? lastname;
  int? phone;

  User(
      {this.username,
      this.password,
      this.email,
      this.address,
      this.firstname,
      this.lastname,
      this.phone});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    address = json['address'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['address'] = address;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['phone'] = phone;
    return data;
  }

  @override
  String toString() {
    return "user:${username!}password: ${password!}";
  }
}
