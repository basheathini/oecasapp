import 'package:oecasapp/constants/firestore_api.dart';
import 'package:oecasapp/constants/locator.dart';
import 'package:oecasapp/custom_models.dart';

class CrudModel {
  FireStore _api = getIt<FireStore>();

  Future<void> addUser(User user) async{
    _api.setReference('users');
    return await _api.addDocument(user.toJson(), user.id);
  }

  Future<User> getUser(String number) async{
    _api.setReference('users');
    User userAdded = await _api.getDocumentById(number).then((onValue) async{
      User user;
      if(onValue.data == null){
        user = null;
      }else{
        user = User.fromJson(onValue.data);
      }
      return user;
    });
    return userAdded;
  }
}