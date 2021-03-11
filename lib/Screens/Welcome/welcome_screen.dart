import 'package:flutter/material.dart';
import 'package:geofencing_deepblue/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'WelcomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
