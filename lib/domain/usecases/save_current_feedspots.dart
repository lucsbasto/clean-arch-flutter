import 'package:amigo_fiel/domain/entities/entities.dart';

abstract class SaveCurrentFeedspots {
  Future<void> save(FeedspotEntity feedspots);
}
