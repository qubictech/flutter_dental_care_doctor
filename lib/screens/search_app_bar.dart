import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheba_dental_care_doctor/models/patient.dart';
import 'package:sheba_dental_care_doctor/screens/home/search_patient.dart';
import 'package:sheba_dental_care_doctor/screens/profile/doctor.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<List<Patient>>(context);

    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () => showSearch(
                context: context, delegate: SearchPatient(patients: patients)),
          ),
          Expanded(
            child: InkWell(
              onTap: () => showSearch(
                  context: context,
                  delegate: SearchPatient(patients: patients)),
              child: Text(
                'Search by Name | Phone | Address',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),
          ),
          IconButton(
            icon: CircleAvatar(
              child: Icon(Icons.person),
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(),
                )),
          ),
        ],
      ),
    );
  }
}
