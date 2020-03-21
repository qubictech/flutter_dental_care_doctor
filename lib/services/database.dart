import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sheba_dental_care_doctor/models/patient.dart';

class DatabaseService {
  DatabaseService({this.uid});
  final String uid;

  // collection references
  final CollectionReference mCollectionRef =
      Firestore.instance.collection('users');

  final CollectionReference mPatientCollection =
      Firestore.instance.collection('patients');

  Future updateUserData(String name, String photoUrl, String birthDate) async {
    return await mCollectionRef.document(uid).setData(
        {'name': name, 'photo_url': photoUrl, 'birth_date': birthDate});
  }

  Future createNewPatient(Patient patient) async {
    return await mPatientCollection.document().setData(
        {'name': patient.name, 'phone': patient.phone, 'addr': patient.addr});
  }

  // brew list from snapshot
  List<Patient> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Patient(
          name: doc.data['name'] ?? '',
          phone: doc.data['phone'] ?? 0,
          addr: doc.data['addr'] ?? '');
    }).toList();
  }

  // get brews stream
  Stream<List<Patient>> get patients {
    return mPatientCollection.snapshots().map(_brewListFromSnapshot);
  }
}
