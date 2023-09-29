import 'package:amigo_fiel/domain/entities/entities.dart';
import 'package:get/get.dart';

import 'package:amigo_fiel/domain/usecases/usecases.dart';

class GetxHomePresenter extends GetxController {
  final LoadCurrentAccount loadCurrentAccount;
  final LoadFeedspots loadAllFeedspots;
  final feedspots = Rx<List<FeedspotEntity>>([]);
  final _user = Rx<UserEntity?>(null);
  UserEntity? get user => _user.value;

  GetxHomePresenter({
    required this.loadCurrentAccount,
    required this.loadAllFeedspots,
  });

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    try {
      final loadedUser = await loadCurrentAccount.load();
      _user.value = loadedUser ??
          const UserEntity(
            id: '123456',
            accessToken: 'fakeAccessToken',
            firstName: 'Visitante',
            lastName: '',
            phoneNumber: '555-555-5555',
            email: 'john.doe@example.com',
            avatarUrl: 'https://cdn1.iconfinder.com/data/icons/big-rocket/80/BigRocket-1-01-512.png',
            isAdmin: false,
            isVerified: true,
          );
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadFeedspots() async {
    try {
      feedspots.value = await loadAllFeedspots.load();
    } catch (error) {
      feedspots.value = [];
      print(error);
    }
  }
}
