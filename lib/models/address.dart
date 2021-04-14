import 'package:flutter/cupertino.dart';

class Address {
  String country;
  String province;
  String town;
  String postalCode;

  Address(
      {@required this.country,
      @required this.province,
      @required this.town,
      @required this.postalCode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return new Address(
        country: json['country'],
        province: json['province'],
        town: json['town'],
        postalCode: json['postalCode']);
  }
}
