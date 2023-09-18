import 'package:get/get.dart';

import 'package:amigo_fiel/domain/usecases/usecases.dart';

class GetxSplashPresenter extends GetxController {
  final LoadCurrentAccount loadCurrentAccount;
  final LoadFeedspots loadAllFeedspots;
  final SaveCurrentFeedspots saveCurrentFeedspots;
  RxBool animate = false.obs;

  final _navigateTo = RxString('');
  Stream<String> get navigateToStream => _navigateTo.stream;

  GetxSplashPresenter({
    required this.loadCurrentAccount,
    required this.loadAllFeedspots,
    required this.saveCurrentFeedspots,
  });

  Future<void> loadAccount() async {
    await Future.delayed(const Duration(seconds: 5));
    try {
      final account = await loadCurrentAccount.load();
      _navigateTo.value = account == null ? '/login' : '/maps';
    } catch (e) {
      _navigateTo.value = '/login';
    }
  }

  Future<void> loadFeedspots() async {
    try {
      final fetchedFeedspots = await loadAllFeedspots.load();
      for (final feedspot in fetchedFeedspots) {
        await saveCurrentFeedspots.save(feedspot);
      }
    } catch (error) {
      print(error);
    }
  }

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    animate.value = true;
    await Future.delayed(const Duration(seconds: 3));
    animate.value = false;
    await Future.delayed(const Duration(seconds: 2));
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}
