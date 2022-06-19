import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phonehospital/model/lab.dart';
import 'package:phonehospital/model/patient.dart';
import 'package:http/http.dart' as http;
import 'package:phonehospital/model/patient_info.dart';
import 'package:phonehospital/model/rad.dart';
import 'package:phonehospital/screens/home_pages/patients_page.dart';
import 'package:phonehospital/screens/login_page/login_page.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/url.dart';

class PatientInfoProvider extends ChangeNotifier {
  String imageReq = "";
  String labReq = "";
  bool loading = true;
  List<PatientInfo> listPatientInfo = [];
  List<Lab> listLab = [];
  List<Rad> listRad = [];
  bool isEmpty = true;

  PatientInfoProvider(){
    getPatientInfo();

  }


  getPatientInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final String? patientId = prefs.getString('patientId');

    loading = true;
    notifyListeners();
    var url = "${URL.BASE_URL}/getPatientInfo/${patientId}";
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      listPatientInfo = (jsonDecode(response.body) as List)
          .map((e) => new PatientInfo.fromJson(e))
          .toList();

      if(listPatientInfo.isEmpty){
        isEmpty=true;
      }else{
        isEmpty=false;
       await getLabResult();
        await getRadResult();
      }

      loading = false;
    } else {
      loading = false;
      throw Exception("Failed to load data");
    }
    notifyListeners();
  }


  getLabResult() async {
    final prefs = await SharedPreferences.getInstance();
    final String? patientId = prefs.getString('patientId');

    loading = true;
    notifyListeners();
    var url = "${URL.BASE_URL}/getLabResult/${patientId}";
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      listLab = (jsonDecode(response.body) as List)
          .map((e) => new Lab.fromJson(e))
          .toList();

      if(listPatientInfo.isEmpty){
        isEmpty=true;
      }else{
        isEmpty=false;
      }

      loading = false;
    } else {
      loading = false;
      throw Exception("Failed to load data");
    }
    notifyListeners();
  }


  getRadResult() async {
    final prefs = await SharedPreferences.getInstance();
    final String? patientId = prefs.getString('patientId');

    loading = true;
    notifyListeners();
    var url = "${URL.BASE_URL}/getRadResult/${patientId}";
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      listRad = (jsonDecode(response.body) as List)
          .map((e) => new Rad.fromJson(e))
          .toList();

      if(listPatientInfo.isEmpty){
        isEmpty=true;
      }else{
        isEmpty=false;
      }

      loading = false;
    } else {
      loading = false;
      throw Exception("Failed to load data");
    }
    notifyListeners();
  }



  addPatientInfo(PatientInfo patientInfo, BuildContext context) async {
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
        "${URL.BASE_URL}/addPatientInfo/${patientInfo.patientId}/${patientInfo.symptoms}/${patientInfo.diagnosis}/${patientInfo.isLab}/${patientInfo.labName}/${patientInfo.isRad}/${patientInfo.radName}/${patientInfo.isSpe}/${patientInfo.speName}";
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      pr.hide();
      const snackBar = SnackBar(
        content: Text('Patient Info Added'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);


      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.bottomToTop, child: PatirntsPage()));

      loading = false;
    } else {
      throw Exception("Not get Data");
      loading = false;
    }
    notifyListeners();
  }

  addMedicationAndPrice(String price,String medication,String patientId,BuildContext context) async {

    var url =
        "${URL.BASE_URL}/addMedicationAndPrice/${patientId}/${medication}/${price}";
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      const snackBar = SnackBar(
        content: Text('Submitted'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.bottomToTop, child: PatirntsPage()));

      loading = false;
    } else {
      throw Exception("Not get Data");
      loading = false;
    }
    notifyListeners();
  }







  changeLabReq(String lab) async {
    labReq = lab;
    notifyListeners();
  }

  changeImageReq(String image) async {
    imageReq = image;
    notifyListeners();
  }
}
