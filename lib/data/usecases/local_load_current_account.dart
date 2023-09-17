import 'package:amigo_fiel/data/cache/cache.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

class LocalLoadCurrentAccount implements LoadCurrentAccount {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalLoadCurrentAccount({required this.fetchSecureCacheStorage});

  @override
  Future<UserEntity> load() async {
    try {
      final user = await fetchSecureCacheStorage.fetch();
      return UserEntity.fromJson(user).toEntity();
    } catch (error) {
      rethrow;
    }
  }
}
