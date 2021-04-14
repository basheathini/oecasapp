import 'package:flutter/cupertino.dart';

class Message {
  String id;
  String message;
  String type;
  Message({@required this.id, @required this.message, @required this.type});

  factory Message.fromJson(Map<String, dynamic> json) {
    return new Message(
        id: json['id'], message: json['message'], type: json['type']);
  }
}
