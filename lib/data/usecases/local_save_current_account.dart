import 'package:amigo_fiel/data/cache/save_secure_cache_storage.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../domain/helpers/domain_error.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentAccount({required this.saveSecureCacheStorage});

  @override
  Future<void> save(UserEntity account) async {
    try {
      await saveSecureCacheStorage.save(key: 'token', value: account.accessToken);
    } catch (error) {
      rethrow;
    }
  }
}
