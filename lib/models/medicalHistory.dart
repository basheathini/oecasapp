import 'package:flutter/cupertino.dart';

class MedicalHistory {
  String name;
  int score;

  MedicalHistory({@required this.name, @required this.score});

  factory MedicalHistory.fromJson(Map<String, dynamic> json) {
    return new MedicalHistory(name: json['name'], score: json['score']);
  }
}
