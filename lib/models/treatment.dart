import 'package:sheba_dental_care_doctor/models/payment.dart';

class Treatment extends Payment {
  String treatment;
  String nextMeeting;
  Treatment({this.treatment, this.nextMeeting});
}
