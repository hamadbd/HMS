import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phonehospital/constant/my_constant.dart';
import 'package:phonehospital/providers/patient_provider.dart';
import 'package:phonehospital/screens/home_pages/patient_info_page.dart';
import 'package:phonehospital/screens/welcome_page/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/sizedbox.dart';
import 'ambulance_page.dart';

class PatirntsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PatientProvider>(
      create: (_) => PatientProvider(),
      child: Consumer<PatientProvider>(
        builder: (_, provObj, __) => Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: AmbulancePage()));
            },
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  HeightSizedBox(h: 0.2),
                  Text("Dashboard", style: TextStyle(fontSize: 16)),
                  Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 60,
                    color: Colors.black,
                  ),
                  Text(
                    "Patients",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: provObj.listPatient.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 13.0),
                            child: Center(
                              child: Container(
                                decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.5),
                                      blurRadius: 20.0, // soften the shadow
                                      spreadRadius: 0.0, //extend the shadow
                                      offset: Offset(
                                        5.0,
                                        // Move to right 10  horizontally
                                        5.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ],
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 0,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.93,
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            size: 100,
                                          ),
                                          VerticalDivider(
                                            color: Colors.black,
                                            thickness: 1,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                  provObj.listPatient[index]
                                                      .fullName
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  )),
                                              HeightSizedBox(h: 0.02),
                                              Text(
                                                  provObj
                                                      .listPatient[index].natId
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  )),
                                              HeightSizedBox(h: 0.02),
                                              Text(
                                                  provObj.listPatient[index].age
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  )),
                                              HeightSizedBox(h: 0.02),
                                              Text(
                                                  provObj.listPatient[index]
                                                              .status
                                                              .toString() ==
                                                          ""
                                                      ? "Waiting for examination"
                                                      : provObj
                                                          .listPatient[index]
                                                          .status
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  )),
                                              HeightSizedBox(h: 0.02),
                                              InkWell(
                                                onTap: () async {
                                                  if(provObj.listPatient[index].status=="Cured Done"){
                                                    const snackBar = SnackBar(
                                                      content: Text('This patient was cured'),
                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                                  }else{
                                                    final prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                    await prefs.setString(
                                                        'patientId',
                                                        provObj
                                                            .listPatient[index]
                                                            .iD
                                                            .toString());

                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                            PageTransitionType
                                                                .bottomToTop,
                                                            child: PatientInfoPage(
                                                                provObj.listPatient[
                                                                index])));

                                                  }
                                                  },
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Select Patient ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_right_sharp,
                                                      size: 30,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
