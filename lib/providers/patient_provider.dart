import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phonehospital/model/patient.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

import '../constant/url.dart';

class PatientProvider extends ChangeNotifier {
  bool loading = true;
  List<Patient> listPatient = [];

  PatientProvider(){
    getPatients();
  }
  addPatient(Patient patient, BuildContext context) async {
    final ProgressDialog pr = ProgressDialog(context,
        type: ProgressDialogType.Download, isDismissible: false);

    pr.style(
      message: 'Loading ... ',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      progress: 0.0,
      textAlign: TextAlign.right,
      maxProgress: 100.0,
    );
    await pr.show();
    var url =
        "${URL.BASE_URL}/addPatient/${patient.fullName}/${patient.natId}/${patient.birthDate}/${patient.age}/${patient.medicalRecord}/${patient.evaluation}";
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      pr.hide();
      const snackBar = SnackBar(
        content: Text('Patient Added'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      loading = false;
    } else {
      throw Exception("Not get Data");
      loading = false;
    }
    notifyListeners();
  }


  getPatients() async {
    loading = true;
    notifyListeners();
    var url = "${URL.BASE_URL}/getPatient";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      listPatient = (jsonDecode(response.body) as List)
          .map((e) => new Patient.fromJson(e))
          .toList();
      loading = false;
    } else {
      loading = false;
      throw Exception("Failed to load data");
    }
    notifyListeners();
  }
}
