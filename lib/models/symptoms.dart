import 'package:flutter/cupertino.dart';

class Symptoms {
  String name;
  int score;

  Symptoms({@required this.name, @required this.score});

  factory Symptoms.fromJson(Map<String, dynamic> json) {
    return new Symptoms(name: json['name'], score: json['score']);
  }
}
