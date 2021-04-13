import 'package:cloud_firestore/cloud_firestore.dart';
class FireStore {

  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference reference;

  FireStore(this.path) {
    reference =_db.collection(path);
  }

}