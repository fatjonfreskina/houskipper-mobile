import 'dart:convert';

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String? phoneNumber;
  String? jwt;

  User(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      this.phoneNumber,
      this.jwt});

  // Factory method to create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] ?? '',
        email: json['email'] ?? '',
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        phoneNumber: json['phoneNumber'],
        jwt: json['jwt']);
  }

  // Convert the User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'jwt': jwt
    };
  }

  @override
  String toString() {
    return 'id: $id, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber jwt: $jwt';
  }
}
