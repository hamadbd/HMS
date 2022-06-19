import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phonehospital/model/lab.dart';
import 'package:phonehospital/model/medication.dart';
import 'package:phonehospital/model/patient.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

import '../constant/url.dart';
import '../screens/home_pages/medication_page.dart';
import '../screens/login_page/login_page.dart';

class MedicationProvider extends ChangeNotifier {
  bool loading = true;
  List<Medication> listMedication = [];
  List<Patient> listPatient = [];
  bool isAny = false;

  MedicationProvider(){
    getMedication();
  }



  getMedication() async {
    loading = true;
    notifyListeners();
    var url = "${URL.BASE_URL}/getMedication";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      listMedication = (jsonDecode(response.body) as List)
          .map((e) => new Medication.fromJson(e))
          .toList();
      if(listMedication.isEmpty){
        loading = false;
        isAny = false;
      }else{
        isAny=true;
        getPatientById(listMedication[0].patientId.toString());
      }

    } else {
      loading = false;
      throw Exception("Failed to load data");
    }
    notifyListeners();
  }

  getPatientById(String id) async {

    var url = "${URL.BASE_URL}/getPatientById/${id}";
    print(url);
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

  updateMedicationStatus( String id,BuildContext context) async {
    loading = true;
    notifyListeners();
    var url = "${URL.BASE_URL}/updateMedicationStatus/${id}";
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      const snackBar = SnackBar(
        content: Text('update saved'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.bottomToTop, child: MedicationPage()));
    } else {
      loading = false;
      throw Exception("Failed to load data");
    }
    notifyListeners();
  }
}
