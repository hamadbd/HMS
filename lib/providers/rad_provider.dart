import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phonehospital/model/lab.dart';
import 'package:phonehospital/model/patient.dart';
import 'package:http/http.dart' as http;
import 'package:phonehospital/model/rad.dart';
import 'package:phonehospital/screens/home_pages/medical_page.dart';
import 'package:phonehospital/screens/home_pages/radiologic_page.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../constant/url.dart';
import '../screens/login_page/login_page.dart';

class RadProvider extends ChangeNotifier {
  bool loading = true;
  List<Rad> listRad = [];
  List<Patient> listPatient = [];
  bool isAny = false;

  RadProvider(){
    getRad();
  }



  getRad() async {
    loading = true;
    notifyListeners();
    var url = "${URL.BASE_URL}/getRad";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      listRad = (jsonDecode(response.body) as List)
          .map((e) => new Rad.fromJson(e))
          .toList();
      if(listRad.isEmpty){
        loading = false;
        isAny = false;
      }else{
        isAny=true;
        getPatientById(listRad[0].patientId.toString());
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

  updateRadResult(String patientId , String id,String result,BuildContext context) async {
    loading = true;
    notifyListeners();
    var url = "${URL.BASE_URL}/updateRadResult/${id}/${result}/${patientId}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      const snackBar = SnackBar(
        content: Text('update saved'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.bottomToTop, child: RadiologicPage()));
    } else {
      loading = false;
      throw Exception("Failed to load data");
    }
    notifyListeners();
  }
}
