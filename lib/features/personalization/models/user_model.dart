import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatters.dart';

/// Model class representing user data.
class UserModel {

  // Keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number.
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(' ');

  /// Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    String camelCaseUsername = '$firstName$lastName'; // Combine first and last name
    String usernameWithPrefix = 'cwt_$camelCaseUsername'; // Add "cwt_" prefix
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model.
  static UserModel empty() =>
      UserModel(
          id: '',
          firstName: '',
          lastName: '',
          username: '',
          email: '',
          phoneNumber: '',
          profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    try {
      if (document.exists) {
        final data = document.data();
        print('Data from Firestore: $data');
        return UserModel(
          id: document.id,
          firstName: data?['FirstName'] ?? '',
          lastName: data?['LastName'] ?? '',
          username: data?['Username'] ?? '',
          email: data?['Email'] ?? '',
          phoneNumber: data?['PhoneNumber'] ?? '',
          profilePicture: data?['ProfilePicture'] ?? '',
        );
      } else {
        // Return a default instance of UserModel if the document doesn't exist
        return UserModel.empty();
      }
    } catch (e) {
      print('Error parsing Firestore document: $e');
      // Handle error by returning an empty user model or appropriate default values
      return UserModel.empty();
    }
  }
}



