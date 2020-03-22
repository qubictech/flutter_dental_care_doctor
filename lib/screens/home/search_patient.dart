import 'package:flutter/material.dart';
import 'package:sheba_dental_care_doctor/models/patient.dart';
import 'package:sheba_dental_care_doctor/screens/patient/patient_info.dart';

class SearchPatient extends SearchDelegate<String> {
  SearchPatient({this.patients});
  final List<Patient> patients;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // search query parallely in list using || (or)
    final suggestionList = query.isEmpty
        ? patients
        : patients
            .where(
              (patient) =>
                  patient.name.contains(RegExp(query, caseSensitive: false)) ||
                  patient.phone
                      .toString()
                      .contains(RegExp(query, caseSensitive: false)) ||
                  patient.addr.contains(RegExp(query, caseSensitive: false)),
            )
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientInfo(
                      patient: patients[index],
                    ),
                  ),
                );
              },
              title: RichText(
                text: TextSpan(
                  text: suggestionList[index].name.substring(0, query.length),
                  style: TextStyle(color: Colors.red),
                  children: [
                    TextSpan(
                      text: suggestionList[index].name.substring(query.length),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              subtitle: Text(suggestionList[index].phone.toString()),
            ),
            Divider(
              height: 1,
            )
          ],
        );
      },
      itemCount: suggestionList.length,
    );
  }
}
