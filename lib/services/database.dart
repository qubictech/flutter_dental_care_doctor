import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  DatabaseService({this.uid});
  final String uid;

  // collection references
  final CollectionReference mCollectionRef =
      Firestore.instance.collection('users');

  Future updateUserData(String name, String photoUrl, String birthDate) async {
    return await mCollectionRef.document(uid).setData(
        {'name': name, 'photo_url': photoUrl, 'birth_date': birthDate});
  }
}
