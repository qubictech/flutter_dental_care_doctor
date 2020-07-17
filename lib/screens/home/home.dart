import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheba_dental_care_doctor/models/patient.dart';
import 'package:sheba_dental_care_doctor/screens/home/patient_list.dart';
import 'package:sheba_dental_care_doctor/screens/patient/add_patient.dart';
import 'package:sheba_dental_care_doctor/screens/search_app_bar.dart';
import 'package:sheba_dental_care_doctor/services/database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Patient>>.value(
      value: DatabaseService().patients,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Search(),
        ),
        body: Container(
            child: PatientList(), padding: EdgeInsets.only(top: 12.0)),
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
