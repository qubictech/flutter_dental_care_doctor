import 'package:flutter/material.dart';
import 'package:sheba_dental_care_doctor/authentication/register.dart';
import 'package:sheba_dental_care_doctor/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toogleScreens() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showSignIn
          ? SignIn(
              toogleScreen: toogleScreens,
            )
          : Register(
              toogleScreen: toogleScreens,
            ),
    );
  }
}
