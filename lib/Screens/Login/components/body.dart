import 'package:flutter/material.dart';
import 'package:geofencing_deepblue/Screens/Login/components/body.dart';
import 'package:geofencing_deepblue/Screens/Login/components/background.dart';
import 'package:geofencing_deepblue/Screens/Admin/signup_screen.dart';
import 'package:geofencing_deepblue/components/already_have_an_account_acheck.dart';
import 'package:geofencing_deepblue/components/rounded_button.dart';
import 'package:geofencing_deepblue/components/rounded_input_field.dart';
import 'package:geofencing_deepblue/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geofencing_deepblue/patient/patients_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/doctor.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "DoctorEmail",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
                text: "LOGIN",
                press: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, PatientScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
            SizedBox(height: size.height * 0.03),
            // AlreadyHaveAnAccountCheck(
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SignUpScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
