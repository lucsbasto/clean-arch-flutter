import 'package:amigo_fiel/data/cache/save_secure_cache_storage.dart';
import 'package:amigo_fiel/domain/usecases/usecases.dart';

import '../../../domain/entities/entities.dart';

class LocalSaveCurrentFeedspots implements SaveCurrentFeedspots {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentFeedspots({required this.saveSecureCacheStorage});

  @override
  Future<void> save(FeedspotEntity feedspot) async {
    try {
      final properties = feedspot.toJson().entries;
      for (final property in properties) {
        await saveSecureCacheStorage.save(key: property.key, value: '${property.value}');
      }
    } catch (error) {
      rethrow;
    }
  }
}
