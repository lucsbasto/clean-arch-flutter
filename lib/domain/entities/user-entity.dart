// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}
