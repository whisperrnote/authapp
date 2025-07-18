class User {
  bool? masterpass;
  String userId;
  String email;
  bool? twofa;

  User({
    this.masterpass,
    required this.userId,
    required this.email,
    this.twofa,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      masterpass: map['masterpass'],
      userId: map['userId'].toString(),
      email: map['email'].toString(),
      twofa: map['twofa'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "masterpass": masterpass,
      "userId": userId,
      "email": email,
      "twofa": twofa,
    };
  }
}
