class MyUser {
  final String? uid;
  final bool? isEmailVerified;
  MyUser({this.uid, this.isEmailVerified});
}

class UserData {
  final String? uid;
  final String? name;
  final String? sugars;
  final int? strength;

  UserData({
    this.uid,
    this.name,
    this.sugars,
    this.strength,
  });
  
}
