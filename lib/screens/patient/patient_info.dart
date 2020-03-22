import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sheba_dental_care_doctor/models/patient.dart';

class PatientInfo extends StatefulWidget {
  PatientInfo({this.patient});
  final Patient patient;

  @override
  _PatientInfoState createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  @override
  Widget build(BuildContext context) {
    Widget meetingItem(Patient patient) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.event_note),
            ),
            title: Text(patient
                .name), //add meeting detail eg, condition,paid,meeting date,
          ),
        ],
      );
    }

    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.edit),
              backgroundColor: Colors.red,
              label: 'Manage',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('FIRST CHILD')),
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
            label: 'Meeting',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('SECOND CHILD'),
          ),
          SpeedDialChild(
            child: Icon(Icons.call),
            backgroundColor: Colors.green,
            label: 'Call',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('THIRD CHILD'),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: true,
            expandedHeight: 200,
            title: Text(widget.patient.name),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.all(80.0),
                child: CircleAvatar(
                  child: Text(
                    widget.patient.name[0],
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return meetingItem(widget.patient);
              },
            ),
          ),
        ],
      ),
    );
  }
}
