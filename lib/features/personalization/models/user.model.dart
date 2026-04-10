import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    this.profilePicture = '',
  });

  /// Helper to get full name
  String get fullName => '$firstName $lastName';

  /// Convert to JSON Map for Firestore
  Map<String, dynamic> toJson() => {
        'FirstName': firstName,
        'LastName': lastName,
        'Username': username,
        'Email': email,
        'PhoneNumber': phoneNumber,
        'ProfilePicture': profilePicture,
      };

  /// Create UserModel from Firestore DocumentSnapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return UserModel(
      id: doc.id,
      firstName: data['FirstName'] ?? '',
      lastName: data['LastName'] ?? '',
      username: data['Username'] ?? '',
      email: data['Email'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      profilePicture: data['ProfilePicture'] ?? '',
    );
  }

  /// Empty user
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
      );
}
