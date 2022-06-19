import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:phonehospital/model/patient_info.dart';
import 'package:phonehospital/providers/patient_info_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/sizedbox.dart';
import '../../model/patient.dart';

class PatientInfoPage extends StatelessWidget {
  String selectedValue = "No Specialized";
  TextEditingController txtImage = TextEditingController();
  TextEditingController txtLab = TextEditingController();
  TextEditingController txtSymptoms = TextEditingController();
  TextEditingController txtDiagnosis = TextEditingController();
  TextEditingController txtMedic = TextEditingController();
  TextEditingController txtPrice = TextEditingController();

  // List of items in our dropdown menu
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("No Specialized"), value: "No Specialized"),
      DropdownMenuItem(child: Text("Doctor"), value: "Doctor"),
      DropdownMenuItem(child: Text("Lab"), value: "Lab"),
      DropdownMenuItem(child: Text("Ph"), value: "Ph"),
    ];
    return menuItems;
  }

  Patient patient = new Patient();

  PatientInfoPage(Patient patient1) {
    patient = patient1;
  }

  @override
  Widget build(BuildContext context) {


    String imageReqVal = "";
    String labReqVal = "";
    return ChangeNotifierProvider<PatientInfoProvider>(
      create: (_) => PatientInfoProvider(),
      child: Consumer<PatientInfoProvider>(
        builder: (_, provObj, __) =>  provObj.loading == true
            ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ))
            :Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeightSizedBox(h: 0.2),
                    Text("    Patient Information",
                        style: TextStyle(fontSize: 16)),
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
                        enabled: false,
                        style: TextStyle(
                            fontSize: 15, height: 0.6, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: patient.fullName,
                        ),
                      ),
                    ),
                    Text("  ID"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        enabled: false,
                        style: TextStyle(
                            fontSize: 15, height: 0.6, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: patient.natId,
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
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  enabled: false,
                                  style: TextStyle(
                                      fontSize: 15,
                                      height: 0.6,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: patient.birthDate,
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
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  enabled: false,
                                  style: TextStyle(
                                      fontSize: 15,
                                      height: 0.6,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: patient.age,
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
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        enabled: false,
                        style: TextStyle(
                            fontSize: 15, height: 6, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: patient.medicalRecord,
                        ),
                      ),
                    ),
                    Text("  Evaluation"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        enabled: false,
                        style: TextStyle(
                            fontSize: 15, height: 6, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: patient.evaluation,
                        ),
                      ),
                    ),
                    Text("  Symptoms"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        controller: txtSymptoms,
                        enabled: provObj.isEmpty,
                        style: TextStyle(
                            fontSize: 15, height: 4, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: provObj.isEmpty?'Symptoms':provObj.listPatientInfo[0].symptoms,
                        ),
                      ),
                    ),
                    Text("  Diagnosis"),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        controller: txtDiagnosis,
                        enabled: provObj.isEmpty,
                        style: TextStyle(
                            fontSize: 15, height: 6, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: provObj.isEmpty?'Diagnosis':provObj.listPatientInfo[0].diagnosis,
                        ),
                      ),
                    ),
                    provObj.isEmpty?Container(width: 0,height: 0,): Text("  Lab Result : ${provObj.listLab[0].request}"),
                    provObj.isEmpty?Container(width: 0,height: 0,): Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        controller: txtSymptoms,
                        enabled: provObj.isEmpty,
                        style: TextStyle(
                            fontSize: 15, height: 4, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: provObj.listLab[0].result,
                        ),
                      ),
                    ),
                    provObj.isEmpty?Container(width: 0,height: 0,):Text("  Image Result : ${provObj.listRad[0].request}" ),
                    provObj.isEmpty?Container(width: 0,height: 0,): Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        controller: txtSymptoms,
                        enabled: provObj.isEmpty,
                        style: TextStyle(
                            fontSize: 15, height: 4, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: provObj.listRad[0].result,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: provObj.labReq == "" && provObj.isEmpty
                                  ? Colors.lightBlueAccent
                                  : Colors.greenAccent),
                          onPressed: () {
                            if (provObj.labReq == ""&& provObj.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Please enter The Lab Name'),
                                      content: TextField(
                                        onChanged: (value) {
                                          labReqVal = value;
                                        },
                                        controller: txtLab,
                                        decoration: InputDecoration(
                                            hintText: "Lab Name"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('CANCEL'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            provObj.changeLabReq(labReqVal);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              const snackBar = SnackBar(
                                content: Text('Requested before'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          icon: Icon(LineAwesomeIcons.flask, size: 23),
                          label: Text("Request Lab Test"),
                        ),
                        WidthSizedBox(w: 0.02),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: provObj.imageReq == ""&& provObj.isEmpty
                                  ? Colors.lightBlueAccent
                                  : Colors.greenAccent),
                          onPressed: () {
                            if (provObj.imageReq == ""&& provObj.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          Text('Please enter The Image Name'),
                                      content: TextField(
                                        onChanged: (value) {
                                          imageReqVal = value;
                                        },
                                        controller: txtImage,
                                        decoration: InputDecoration(
                                            hintText: "Image Name"),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Colors.red,
                                          textColor: Colors.white,
                                          child: Text('CANCEL'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        FlatButton(
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          child: Text('OK'),
                                          onPressed: () {
                                            provObj.changeImageReq(imageReqVal);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              const snackBar = SnackBar(
                                content: Text('Requested before'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          icon: Icon(LineAwesomeIcons.x_ray, size: 23),
                          label: Text("Request Image"),
                        )
                      ],
                    ),

                    patient.status=="Waiting for medicines and price "?Text("  Medicines" ):Container(width: 0,height: 0,),
                    patient.status=="Waiting for medicines and price "? Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        controller: txtMedic,
                        style: TextStyle(
                            fontSize: 15, height: 4, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Medicines",
                        ),
                      ),
                    ):Container(width: 0,height: 0,),

                    patient.status=="Waiting for medicines and price "?Text("  Prices " ):Container(width: 0,height: 0,),
                    patient.status=="Waiting for medicines and price "? Padding(
                      padding: EdgeInsets.all(13.0),
                      child: TextField(
                        controller: txtPrice,
                        style: TextStyle(
                            fontSize: 15, height: 4, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Prices",
                        ),
                      ),
                    ):Container(width: 0,height: 0,),

                    Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 60,
                      color: Colors.black,
                    ),
                    Text("    Move To specialized department",
                        style: TextStyle(fontSize: 16)),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                          ),
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            selectedValue = newValue!;
                          },
                          items: dropdownItems),
                    ),
                    Center(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () async {

                          if(patient.status=="Waiting for medicines and price "){
                           provObj.addMedicationAndPrice(txtPrice.text,txtMedic.text,patient.iD.toString(),context);
                          }else if(patient.status=="Waiting for results "){
                            const snackBar = SnackBar(
                              content: Text('Please Wait The Results'),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          }else{
                            PatientInfo patientInfo = new PatientInfo();
                            patientInfo.patientId = patient.iD;
                            patientInfo.diagnosis = txtDiagnosis.text;
                            patientInfo.symptoms = txtSymptoms.text;
                            patientInfo.isLab = provObj.labReq == "" ? 0 : 1;
                            patientInfo.isRad = provObj.imageReq == "" ? 0 : 1;
                            patientInfo.labName = provObj.labReq == "" ? "" : provObj.labReq;
                            patientInfo.radName = provObj.imageReq == "" ? "" : provObj.imageReq;
                            patientInfo.isSpe = 0;
                            patientInfo.speName = "no sp";
                            provObj.addPatientInfo(patientInfo, context);
                          }




                        },
                        icon: Icon(LineAwesomeIcons.share, size: 23),
                        label: Text("Submit"),
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
