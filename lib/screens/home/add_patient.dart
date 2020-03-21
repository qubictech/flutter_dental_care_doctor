import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheba_dental_care_doctor/models/patient.dart';
import 'package:sheba_dental_care_doctor/models/user.dart';
import 'package:sheba_dental_care_doctor/services/database.dart';

class AddNewPatient extends StatefulWidget {
  @override
  _AddNewPatientState createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  var _phone = 0;
  String _addr = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Patient'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? 'Enter an email' : null;
                },
                onChanged: (value) => _name = value,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                  errorText: error.isNotEmpty ? error : null,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? 'Enter an email' : null;
                },
                onChanged: (value) => _phone = value as int,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  border: OutlineInputBorder(),
                  errorText: error.isNotEmpty ? error : null,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? 'Enter an email' : null;
                },
                onChanged: (value) => _addr = value,
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(),
                  errorText: error.isNotEmpty ? error : null,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => DatabaseService(uid: user.uid).createNewPatient(
          Patient(name: _name, addr: _addr, phone: _phone),
        ),
        label: Text('Add New Patient'),
      ),
    );
  }
}
