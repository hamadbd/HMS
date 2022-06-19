import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phonehospital/constant/button_standard.dart';
import 'package:phonehospital/constant/my_constant.dart';
import 'package:phonehospital/constant/sizedbox.dart';
import 'package:phonehospital/constant/text_inut_form.dart';
import 'package:phonehospital/screens/home_pages/billing_page.dart';

import '../home_pages/ambulance_page.dart';
import '../home_pages/medical_page.dart';
import '../home_pages/medication_page.dart';
import '../home_pages/patients_page.dart';
import '../home_pages/radiologic_page.dart';


class LoginPage extends StatelessWidget {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text("Phone Hospital"),
      ),
      body: Container(
        color: mainColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "images/logo.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            TextInputForm(
              text: "user",
              tOrf: false,
              textEditingController: txtName,
            ),
            TextInputForm(
              text: "password",
              tOrf: true,
              textEditingController: txtPass,
            ),
            HeightSizedBox(
              h: 0.06,
            ),
            ButtonStandard(
              buttonText: "Login",
              fontSize: 20.0,
              onPress: () async {

                if(txtPass.text == "1234" ){
                  if(txtName.text == "ambulance"){
                    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: AmbulancePage()));

                  }else if(txtName.text == "medical"){
                    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: PatirntsPage()));

                  }else if(txtName.text == "lab"){
                    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: MedicalPage()));

                  }else if(txtName.text == "radiologic"){
                    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: RadiologicPage()));

                  }else if(txtName.text == "pharmacy"){
                    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: MedicationPage()));

                  }else if(txtName.text == "billing"){
                    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: BillingPage()));

                  }
                  else{
                    const snackBar = SnackBar( content: Text('UserName or Password Wrong'),);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }
                }  else{
                  const snackBar = SnackBar(
                    content: Text('UserName or Password Wrong'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                }

              },
            ),
          ],
        ),
      ),
    );
  }
}