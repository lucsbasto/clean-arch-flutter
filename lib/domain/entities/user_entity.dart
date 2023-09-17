import 'package:amigo_fiel/data/http/http_errors.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String accessToken;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final bool isAdmin;
  final bool isVerified;
  const UserEntity({
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
      isAdmin: json['isAdmin'].toLowerCase() == true,
      isVerified: json['isVerified'].toLowerCase() == true,
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

  @override
  List<Object?> get props => [id, accessToken, firstName, lastName, phoneNumber, email, isAdmin, isVerified];
}
