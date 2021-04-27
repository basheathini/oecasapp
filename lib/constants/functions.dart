import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:oecasapp/custom_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Functions {

  Future<String> saveUserOffline(User user) {
    final LocalStorage storage = new LocalStorage('OecasUsers');
    List<User> users;
    users = storage.getItem('OecasUsers') ?? [];
    users.add(user);
    storage.setItem('OecasUsers', users);
  }

  Future<String> saveQuestionnaireOffline() {
    final LocalStorage storage = new LocalStorage('OecasQuestionnaires');
  }

  Future<String> savePreferences(User user) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    var userData = json.encode({
      'id' : user.id,
      'name': user.name,
      'type' : user.type,
      'mobileNumber' : user.mobileNumber,
      'password' : user.password
    });
    _sharedPreferences.setString('userData', userData);
  }
}