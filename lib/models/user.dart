import 'package:flutter/cupertino.dart';

class User {
  String id;
  String name;
  String username;
  String type;
  String mobileNumber;
  String password;

  User(
      {@required this.id,
      @required this.name,
      @required this.username,
      @required this.type,
      @required this.mobileNumber,
      @required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        type: json['type'],
        mobileNumber: json['mobileNumber'],
        password: json['mobileNumber']);
  }
}
