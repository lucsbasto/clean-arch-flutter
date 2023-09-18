import 'package:amigo_fiel/domain/entities/entities.dart';

class Report {
  final int id;
  final UserEntity user;
  final FeedspotEntity feedSpot;
  final String description;
  final String imageUrl;

  Report({
    required this.id,
    required this.user,
    required this.feedSpot,
    required this.description,
    required this.imageUrl,
  });
}
