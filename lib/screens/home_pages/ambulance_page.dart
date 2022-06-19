import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonehospital/model/patient.dart';
import 'package:provider/provider.dart';
import '../../constant/my_constant.dart';
import '../../constant/sizedbox.dart';
import '../../providers/patient_provider.dart';

class AmbulancePage extends StatelessWidget {

  TextEditingController txtFName = TextEditingController();
  TextEditingController txtNatId = TextEditingController();
  TextEditingController txtBDate = TextEditingController();
  TextEditingController txtAge = TextEditingController();
  TextEditingController txtMedRec = TextEditingController();
  TextEditingController txtEval = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PatientProvider>(
      create: (_) => PatientProvider(),
      child: Consumer<PatientProvider>(
        builder: (_,provObj,__) => Scaffold(
          body: SingleChildScrollView(
            child:  provObj.loading == true
                ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: accentColor,
                ))
                :Container(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeightSizedBox(h: 0.2),
                    Text("    Patient Information", style: TextStyle(fontSize: 16)),
                    Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 60,
                      color: Colors.black,
                    ),
                    HeightSizedBox(h: 0.1),
                    Text("  Full Name"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        controller: txtFName,
                        style: TextStyle(
                            fontSize: 15, height: 0.6, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        ),
                      ),
                    ),
                    Text("  ID"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        controller: txtNatId,
                        style: TextStyle(
                            fontSize: 15, height: 0.6, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'ID',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text("BirthDate"),
                            Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextField(
                                  controller: txtBDate,
                                  style: TextStyle(
                                      fontSize: 15,
                                      height: 0.6,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'BirthDate',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text("Age"),
                            Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextField(
                                  controller: txtAge,
                                  style: TextStyle(
                                      fontSize: 15,
                                      height: 0.6,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Age',
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Text("  Medical Record"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        controller: txtMedRec,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style:
                        TextStyle(fontSize: 15, height: 2, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Medical Record',
                        ),
                      ),
                    ),
                    Text("  Evaluation"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        controller: txtEval,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style:
                        TextStyle(fontSize: 15, height: 2, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Evaluation',
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),),
                        onPressed: () {
                          Patient patient = new Patient();
                          patient.fullName = txtFName.text;
                          patient.natId = txtNatId.text;
                          patient.birthDate = txtBDate.text;
                          patient.age = txtAge.text;
                          patient.medicalRecord = txtMedRec.text;
                          patient.evaluation = txtEval.text;

                          txtFName.text = "";
                          txtNatId.text= "";
                          txtBDate.text= "";
                          txtAge.text= "";
                          txtMedRec.text= "";
                          txtEval.text= "";

                          provObj.addPatient(patient,context);

                          },
                        icon: Icon(LineAwesomeIcons.share, size: 23),
                        label: Text("Send Information"),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
