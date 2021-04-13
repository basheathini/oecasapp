import 'package:get_it/get_it.dart';
import 'package:oecasapp/constants/firestore_api.dart';
GetIt getIt = GetIt();

void setupLocator() {
  getIt.registerSingleton( () => FireStore('https://oecasapp-33ba9.firebaseio.com'));
}