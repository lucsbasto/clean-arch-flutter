import 'package:amigo_fiel/domain/entities/entities.dart';

abstract class SaveCurrentAccount {
  Future<void> save(UserEntity user);
}
