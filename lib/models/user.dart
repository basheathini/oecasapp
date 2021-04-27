import 'package:flutter/cupertino.dart';
import 'package:oecasapp/constants/CrudModel.dart';
import 'package:localstorage/localstorage.dart';
import 'package:oecasapp/custom_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String id;
  String name;
  String type;
  String mobileNumber;
  String password;

  User(
      {@required this.id,
      @required this.name,
      @required this.type,
      @required this.mobileNumber,
      @required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        mobileNumber: json['mobileNumber'],
        password: json['password']);
  }
  toJson() {
    return {
      "id" : id,
      "name" : name,
      "type" : type,
      "mobileNumber" : mobileNumber,
      "password" : password,
    };
  }
}

class Users with ChangeNotifier {
  CrudModel crudModel = new CrudModel();
  List<User> users;
  User user;

  Users({this.user});

  User get userData {
    return user;
  }

  Future<void> addUser(User user) async {
    final LocalStorage storage = new LocalStorage('OecasUsers');
    users = storage.getItem('OecasUsers') ?? [];
    print('-------------------------------${users.length}');

    users.forEach((element) {
      crudModel.addUser(element);
    });
    // users.add(user);
    // storage.setItem('OecasUsers', users);
    //
    // users = storage.getItem('OecasUsers') ?? [];
    // print('-------------------------------${users.length}');
    //crudModel.addUser(user);
    notifyListeners();
  }

  Future<void> getUser(User user) async {
    print(user.mobileNumber);
    user = user;
    notifyListeners();
  }

  Future<bool> clearShared() async{
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.clear();
    notifyListeners();
    return true;
  }
}
