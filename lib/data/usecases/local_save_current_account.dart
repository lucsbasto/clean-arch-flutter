import 'package:amigo_fiel/data/cache/save_secure_cache_storage.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentAccount({required this.saveSecureCacheStorage});

  @override
  Future<void> save(UserEntity account) async {
    try {
      final properties = account.toJson().entries;
      for (final property in properties) {
        await saveSecureCacheStorage.save(key: property.key, value: '${property.value}');
      }
    } catch (error) {
      rethrow;
    }
  }
}
