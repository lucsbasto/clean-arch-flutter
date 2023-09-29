import 'package:amigo_fiel/data/cache/cache.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

class LocalLoadFeedspots implements LoadFeedspots {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalLoadFeedspots({required this.fetchSecureCacheStorage});

  @override
  Future<List<FeedspotEntity>> load() async {
    try {
      final feedspotsMap = await fetchSecureCacheStorage.fetch();
      final List<FeedspotEntity> feedspots = [];
      return feedspots;
    } catch (error) {
      rethrow;
    }
  }
}
