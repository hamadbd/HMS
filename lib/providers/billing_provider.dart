import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phonehospital/model/bill.dart';
import 'package:phonehospital/model/lab.dart';
import 'package:phonehospital/model/medication.dart';
import 'package:phonehospital/model/patient.dart';
import 'package:http/http.dart' as http;
import 'package:phonehospital/screens/home_pages/billing_page.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../constant/url.dart';
import '../screens/home_pages/medication_page.dart';
import '../screens/login_page/login_page.dart';

class BillingProvider extends ChangeNotifier {
  bool loading = true;
  List<Bill> listBill = [];
  List<Patient> listPatient = [];
  bool isAny = false;

  BillingProvider(){
    getBilling();
  }



  getBilling() async {
    loading = true;
    notifyListeners();
    var url = "${URL.BASE_URL}/getBill";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      listBill = (jsonDecode(response.body) as List)
          .map((e) => new Bill.fromJson(e))
          .toList();
      if(listBill.isEmpty){
        loading = false;
        isAny = false;
      }else{
        isAny=true;
        getPatientById(listBill[0].patientId.toString());
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

  updateBillStatus( String id,BuildContext context) async {
    loading = true;
    notifyListeners();
    var url = "${URL.BASE_URL}/updateBillStatus/${id}";
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      const snackBar = SnackBar(
        content: Text('update saved'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.bottomToTop, child: BillingPage()));
    } else {
      loading = false;
      throw Exception("Failed to load data");
    }
    notifyListeners();
  }
}
