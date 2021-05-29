import 'package:cloud_firestore/cloud_firestore.dart';
class FireStore {

  // final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference reference;

  FireStore(this.path) {
    // reference =_db.collection(path);
  }
  setReference(String value){
   // reference = _db.collection(value);
  }

  addDocument(Map data, String id){
    // return reference.document(id).setData(data);
  }
  Future<DocumentSnapshot> getDocumentById(String id){
    // return reference.document(id).get();
  }

  Future<QuerySnapshot> getDocumentByQuery(String field, String id){
    // return reference.where(field, isEqualTo: id).getDocuments();
  }

}