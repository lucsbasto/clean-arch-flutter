import 'package:amigo_fiel/domain/entities/entities.dart';

abstract class Authentication {
  Future<UserEntity> auth({String email, String password});
}
