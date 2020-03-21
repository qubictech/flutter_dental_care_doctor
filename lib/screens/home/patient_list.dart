import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheba_dental_care_doctor/models/patient.dart';

class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<List<Patient>>(context);
    print("Patients: $patients");

    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(patients[index].name),
            ),
            Divider(),
          ],
        );
      },
      itemCount: patients.length,
    );
  }
}
