import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheba_dental_care_doctor/authentication/authenticate.dart';
import 'package:sheba_dental_care_doctor/models/user.dart';
import 'package:sheba_dental_care_doctor/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either home or authenticate 
    return user == null ? Authenticate() : Home();
  }
}
