import 'package:get_it/get_it.dart';
import 'package:oecasapp/constants/CrudModel.dart';
import 'package:oecasapp/constants/firestore_api.dart';
GetIt getIt = GetIt();

void setupLocator() {
  getIt.registerLazySingleton( () => FireStore('https://oecasapp-33ba9.firebaseio.com'));
  getIt.registerLazySingleton( () => CrudModel());
}