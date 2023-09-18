import 'package:amigo_fiel/domain/entities/entities.dart';

abstract class LoadFeedspots {
  Future<List<FeedspotEntity>> load();
}
