import 'package:flutter/cupertino.dart';

class Demography {
  String name;
  String identityNumber;
  String dateOfBirth;
  //int age;
  String maritalStatus;
  String education;
  String gender;

  Demography(
      {@required this.name,
      @required this.identityNumber,
      @required this.dateOfBirth,
      @required this.maritalStatus,
      @required this.education, @required this.gender});

  factory Demography.fromJson(Map<String, dynamic> json) {
    return new Demography(
        name: json['name'],
        identityNumber: json['identityNumber'],
        dateOfBirth: json['dateOfBirth'],
        maritalStatus: json['maritalStatus'],
        education: json['education'],
        gender: json['gender']);
  }
}
