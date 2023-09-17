import 'package:amigo_fiel/domain/entities/entities.dart';

abstract class LoadCurrentAccount {
  Future<UserEntity?> load();
}
