import 'package:amigo_fiel/ui/helpers/errors/ui_errors.dart';
import 'package:get/get.dart';

abstract class LoginPresenter {
  Rx<UIError?> get emailError;
  Rx<UIError?> get passwordError;
  Rx<UIError?> get mainError;
  RxBool get isFormValid;
  RxBool get isLoading;

  void validateEmail(String email);
  void validatePassword(String password);
  Future<void> auth();
}
