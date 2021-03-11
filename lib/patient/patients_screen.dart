import 'package:flutter/material.dart';
import 'package:geofencing_deepblue/main.dart';
import 'package:geofencing_deepblue/patient/mapview.dart';
import 'package:geofencing_deepblue/patient/add_patients.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientScreen extends StatefulWidget {
  static const String id = 'patients_screen';
  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  // DoctorsPatients doctorkaka = DoctorsPatients('lala');
  // List patientsListforSpecific = patientList();
  final _firestore = FirebaseFirestore.instance;
  void userStreams() async {
    await for (var snapshot
        in _firestore.collection('patientname').snapshots()) {
      for (var makenew in snapshot.docs) {
        print(makenew.data()['patientnalo']);
        MakePatientCards(makenew.data()['patientnalo']);
      }
    }
  }
  // void getmessage() async {
  //   final message = await _firestore.collection('patientname').get();
  //   for (var message in message.docs) {
  //     print(message.data());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors Name'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.assignment_ind_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              userStreams();
              Navigator.pushNamed(context, AddPatient.id);
            },
            tooltip: 'add new patient info',
            padding: EdgeInsets.only(right: 50.0),
            iconSize: 35.0,
          ),
        ],
      ),

      //try to make listlength of cards
      body: Stack(
        fit: StackFit.expand,
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('patientname').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final patientname = snapshot.data.docs;
                  List<Widget> patientNameWidget = [];
                  for (var patientsname in patientname) {
                    final patientsnameText = patientsname.data()['patientnalo'];
                    patientNameWidget.add(GestureDetector(
                      //track button here
                      onTap: () {
                        Navigator.pushNamed(context, MapView.id);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                        width: double.infinity,
                        height: 35.0,

                        //list will come here
                        child: Center(child: Text(patientsnameText.toString())),
                      ),
                    ));
                  }

                  return Column(
                    children: patientNameWidget,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ),
                  );
                }
              }),
          SvgPicture.asset(
            "assets/icons/researcher.svg",
            height: size.height * 0.75,
          ),
        ],
      ),
    );
  }
}

class MakePatientCards extends StatelessWidget {
  var patientsNames;
  MakePatientCards(makenew) {
    patientsNames = makenew;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // GestureDetector(
        //   //track button here
        //   onTap: () {
        //     Navigator.pushNamed(context, MapView.id);
        //   },
        //   child: Container(
        //     margin: EdgeInsets.all(10.0),
        //     decoration: BoxDecoration(
        //       color: Colors.teal,
        //       borderRadius: BorderRadius.circular(10.0),
        //     ),
        //
        //     width: double.infinity,
        //     height: 35.0,
        //
        //     //list will come here
        //     child: Center(child: Text(patientsNames)),
        //   ),
        // ),
      ],
    );
  }
}
