import 'package:amigo_fiel/domain/usecases/fill_feedspot.dart';
import 'package:amigo_fiel/domain/usecases/usecases.dart';

import '../http/http.dart';

import '../../domain/entities/entities.dart';

class RemoteHandleFeedspots implements LoadFeedspots, LoadFeedspotsById, FillFeedspot {
  final HttpClient httpClient;
  final String url;

  RemoteHandleFeedspots({required this.httpClient, required this.url});

  @override
  Future<List<FeedspotEntity>> load() async {
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'get',
      );
      final List<FeedspotEntity> feedspots = [];
      for (final feedspot in httpResponse) {
        feedspots.add(FeedspotEntity.fromJson(feedspot).toEntity());
      }
      return feedspots;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FeedspotEntity> loadById(String id) async {
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'get',
      );
      return FeedspotEntity.fromJson(httpResponse).toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FeedspotEntity> fill({
    required String feedspotId,
  }) async {
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'get',
      );
      return FeedspotEntity.fromJson(httpResponse).toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
