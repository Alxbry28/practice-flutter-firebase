import 'dart:convert';

class User {
  String? id;
  String? username;
  String? email;
  String? password;
  String? firstname;
  String? lastname;
  String? mobileNumber;

  User({
    this.id,
    this.username,
    this.email,
    this.password,
    this.firstname,
    this.lastname,
    this.mobileNumber,
  });

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
    String? firstname,
    String? lastname,
    String? mobileNumber,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      mobileNumber: mobileNumber ?? this.mobileNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
      'mobileNumber': mobileNumber,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      mobileNumber: map['mobileNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, password: $password, firstname: $firstname, lastname: $lastname, mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.mobileNumber == mobileNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        mobileNumber.hashCode;
  }
}
