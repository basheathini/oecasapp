import 'package:flutter/cupertino.dart';
import 'package:oecasapp/models/address.dart';
import 'package:oecasapp/models/demography.dart';
import 'package:oecasapp/models/medicalHistory.dart';
import 'package:oecasapp/models/message.dart';
import 'package:oecasapp/models/symptoms.dart';

class DataEntry {
  String id;
  String capturedBy;
  int score;
  Message message;
  Address address;
  Demography demography;
  MedicalHistory medicalHistory;
  Symptoms symptoms;
  DateTime dateTime;

  DataEntry(
      {@required this.id,
      @required this.capturedBy,
      @required this.score,
      @required this.message,
      @required this.address,
      @required this.demography,
      @required this.medicalHistory,
      @required this.symptoms,
      @required this.dateTime});

  factory DataEntry.fromJson(Map<String, dynamic> json) {
    return new DataEntry(
        id: json['id'],
        capturedBy: json['capturedBy'],
        score: json['score'],
        message: json['message'],
        address: json['address'],
        demography: json['demography'],
        medicalHistory: json['medicalHistory'],
        symptoms: json['symptoms'],
        dateTime: json['dateTime']);
  }

  toJson() {
    return {
        "id": id,
        "capturedBy": capturedBy,
        "score": score,
        "message": message,
        "address": address,
        "demography": demography,
        "medicalHistory": medicalHistory,
        "symptoms": symptoms,
        "dateTime": dateTime };
  }
}

class Data with ChangeNotifier {
  List<DataEntry> data_entry_list;
  DataEntry data_entry;

  Data(this.data_entry_list);

  List<DataEntry> get dataEntries {
    return data_entry_list;
  }

  DataEntry get dataEntry {
    return data_entry;
  }

  Future<void> addDataEntry(DataEntry dataEntry) async {
    notifyListeners();
  }

  Future<void> getDataEntries() async {
    notifyListeners();
  }
}
