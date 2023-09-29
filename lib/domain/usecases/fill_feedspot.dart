import 'package:amigo_fiel/domain/entities/entities.dart';

abstract class FillFeedspot {
  Future<FeedspotEntity> fill({required String feedspotId});
}
