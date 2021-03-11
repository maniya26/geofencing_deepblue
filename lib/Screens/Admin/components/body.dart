import 'package:flutter/material.dart';
import 'package:geofencing_deepblue/Screens/Login/login_screen.dart';
import 'package:geofencing_deepblue/Screens/Admin/components/background.dart';
import 'package:geofencing_deepblue/components/already_have_an_account_acheck.dart';
import 'package:geofencing_deepblue/components/rounded_button.dart';
import 'package:geofencing_deepblue/components/rounded_input_field.dart';
import 'package:geofencing_deepblue/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geofencing_deepblue/Screens/Homepage/homescreen.dart';

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
              "ADMIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/researcher.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Doctor Email",
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
                text: "SIGNUP",
                press: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, MyHomePage.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
