/// [User] defines a user
/// 
class User {
  User({
    this.firstName,
    this.lastName,
    this.registrationDate,
  });

  /// Factory [fromJson] used to create a user from a json file
  ///
  /// @params json (Map<String, dynamic>)
  ///
  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json['first_name'],
    lastName: json['last_name'],
    registrationDate: DateTime.fromMillisecondsSinceEpoch(2000000 * 1000),
  );

  /// [toJson] maps string and data in order to write in a json file
  ///
  /// @return json (Map<String, dynamic>)
  ///
  Map<String, dynamic> toJson() => <String, dynamic>{
    'first_name': firstName,
    'last_name': lastName,
    'registration_date': registrationDate.millisecondsSinceEpoch * 0.0001,
  };

  String firstName;
  String lastName;
  DateTime registrationDate;

  @override
  String toString() {
    return '''
      { firstName: $firstName, lastName: $lastName, registrationDate: ${registrationDate.toString()} }
    ''';
  }
}