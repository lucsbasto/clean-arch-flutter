// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amigo_fiel/data/http/http_errors.dart';

class UserEntity {
  String id;
  String accessToken;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String isAdmin;
  String isVerified;
  UserEntity({
    required this.id,
    required this.accessToken,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.isAdmin,
    required this.isVerified,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accessToken': accessToken,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'isAdmin': isAdmin,
      'isVerified': isVerified,
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('accessToken')) {
      throw HttpError.invalidData;
    }
    return UserEntity(
      id: json['id'],
      accessToken: json['accessToken'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      isAdmin: json['isAdmin'],
      isVerified: json['isVerified'],
    );
  }
  UserEntity toEntity() => UserEntity(
        accessToken: accessToken,
        id: id,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        isAdmin: isAdmin,
        isVerified: isVerified,
      );
}
