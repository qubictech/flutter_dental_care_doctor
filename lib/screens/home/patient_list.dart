import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheba_dental_care_doctor/models/patient.dart';
import 'package:sheba_dental_care_doctor/screens/patient/patient_info.dart';

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
              leading: CircleAvatar(
                child: Text(patients[index].name[0]),
              ),
              title: Text(patients[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(patients[index].phone.toString()),
                  Text(patients[index].addr.toString())
                ],
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientInfo(
                    patient: patients[index],
                  ),
                ),
              ),
            ),
            Divider(
              height: 16.0,
            ),
          ],
        );
      },
      itemCount: patients.isNotEmpty ? patients.length : 0,
    );
  }
}
