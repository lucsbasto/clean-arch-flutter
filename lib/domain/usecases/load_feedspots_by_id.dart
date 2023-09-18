import 'package:amigo_fiel/domain/entities/entities.dart';

abstract class LoadFeedspotsById {
  Future<FeedspotEntity> loadById(String id);
}
