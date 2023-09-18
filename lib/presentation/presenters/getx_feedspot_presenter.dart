import 'package:amigo_fiel/domain/entities/feedspot_entity.dart';
import 'package:amigo_fiel/domain/usecases/usecases.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetxFeedspotPresenter extends GetxController {
  final LoadCurrentAccount loadCurrentAccount;
  final LoadFeedspotsById loadFeedspotsById;
  final LoadFeedspots loadFeedspots;
  final SaveCurrentFeedspots saveCurrentFeedspots;

  final RxList<FeedspotEntity> feedspots = <FeedspotEntity>[].obs;
  final Rx<FeedspotEntity?> _feedSpot = Rx<FeedspotEntity?>(null);

  GetxFeedspotPresenter({
    required this.loadCurrentAccount,
    required this.loadFeedspots,
    required this.loadFeedspotsById,
    required this.saveCurrentFeedspots,
  });

  FeedspotEntity? get feedspot => _feedSpot.value;

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  Future<void> getAll() async {
    try {
      final fetchedFeedspots = await loadFeedspots.load();
      feedspots.value = fetchedFeedspots;
    } catch (error) {
      print(error);
    }
  }

  setFeedspot(FeedspotEntity feedspot) {
    _feedSpot.value = feedspot;
  }

  Future<void> fill() async {
    final client = http.Client();
    try {
      await client.put(
        Uri.http('192.168.100.7:3000', 'feedspots/${feedspot?.id}/fill', {'userId': ''}),
      );
      await getAll();
    } catch (error) {
      print(error);
    }
  }
}
