import 'package:flutter/material.dart';
import 'package:geofencing_deepblue/Screens/Welcome/welcome_screen.dart';
import 'package:geofencing_deepblue/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geofencing_deepblue/patient/patients_screen.dart';
import 'package:geofencing_deepblue/patient/mapview.dart';
import 'package:geofencing_deepblue/patient/add_patients.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: FutureBuilder(
      //     future: _fbApp,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError) {
      //         print('You have an error! ${snapshot.error.toString()}');
      //         return Text('Something went wrong!');
      //       } else if (snapshot.hasData) {
      //         return WelcomeScreen();
      //       } else {
      //         return Center(child: CircularProgressIndicator());
      //       }
      //     }),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        PatientScreen.id: (context) => PatientScreen(),
        MapView.id: (context) => MapView(),
        AddPatient.id: (context) => AddPatient(),
      },
    );
  }
}
