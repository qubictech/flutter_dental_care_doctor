class User {
  User({this.uid});
  final String uid;
}

class UserData {
  UserData({this.uid, this.photoUrl, this.brithDate, this.name});

  final String uid;
  final String name;
  final String photoUrl;
  final int brithDate;
}
