import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheba_dental_care_doctor/models/patient.dart';
import 'package:sheba_dental_care_doctor/screens/home/add_patient.dart';
import 'package:sheba_dental_care_doctor/screens/home/patient_list.dart';
import 'package:sheba_dental_care_doctor/services/auth.dart';
import 'package:sheba_dental_care_doctor/services/database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Patient>>.value(
      value: DatabaseService().patients,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Flutter'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person_outline),
              label: Text("LOGOUT"),
            ),
          ],
        ),
        body: PatientList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewPatient(),
            ),
          ),
        ),
      ),
    );
  }
}
