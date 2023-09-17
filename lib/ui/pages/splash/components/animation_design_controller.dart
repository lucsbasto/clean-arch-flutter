// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:amigo_fiel/domain/usecases/usecases.dart';

class GextSplashController extends GetxController {
  final LoadCurrentAccount loadCurrentAccount;

  final _navigateTo = RxString('');
  Stream<String> get navigateToStream => _navigateTo.stream;

  RxBool animate = false.obs;

  GextSplashController({
    required this.loadCurrentAccount,
    required this.animate,
  });

  Future<void> loadAccount() async {
    try {
      final account = await loadCurrentAccount.load();
      _navigateTo.value = account == null ? '/login' : '/maps';
    } catch (e) {
      _navigateTo.value = '/login';
    }
  }

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 1500));
    Get.toNamed('/onboarding');
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}
