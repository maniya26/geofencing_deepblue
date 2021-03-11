import 'package:flutter/material.dart';
import 'package:geofencing_deepblue/main.dart';
import 'package:geofencing_deepblue/Screens/Login/login_screen.dart';
import 'package:geofencing_deepblue/Screens/Admin/components/background.dart';
import 'package:geofencing_deepblue/components/already_have_an_account_acheck.dart';
import 'package:geofencing_deepblue/components/rounded_button.dart';
import 'package:geofencing_deepblue/components/rounded_input_field.dart';
import 'package:geofencing_deepblue/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:geofencing_deepblue/patient/patients_screen.dart';

class AddPatient extends StatefulWidget {
  static const String id = 'AddPatient';

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final _firestore = FirebaseFirestore.instance;
  String patientId;
  String patientName;
  String doctorAlloName;
  String roomNoAllo;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Patient'),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.assignment_ind_rounded,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       Navigator.pushNamed(context, AddPatient.id);
        //     },
        //     tooltip: 'add new patient info',
        //     padding: EdgeInsets.only(right: 50.0),
        //     iconSize: 35.0,
        //   ),
        // ],
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   "ADMIN",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/researcher.svg",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                hintText: "Patient's Id",
                onChanged: (value) {
                  patientId = value;
                },
              ),
              RoundedInputField(
                hintText: "Patients Name",
                onChanged: (value) {
                  patientName = value;
                },
              ),
              RoundedInputField(
                hintText: "Doctor Allocated",
                onChanged: (value) {
                  doctorAlloName = value;
                },
              ),
              RoundedInputField(
                hintText: "Room Number Alloted",
                onChanged: (value) {
                  roomNoAllo = value;
                },
              ),
              RoundedButton(
                text: "Add Patient",
                press: () {
                  _firestore.collection('newpatient').add({
                    'patientid': patientId,
                    'patientname': patientName,
                    'doctorallocated': doctorAlloName,
                    'roomnoallo': roomNoAllo,
                  });
                  Navigator.pushNamed(context, PatientScreen.id);
                },
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
