import 'package:get/get.dart';

import '../../domain/helpers/domain_error.dart';

import '../../domain/usecases/authentication.dart';
import '../protocols/validation.dart';

class GetxLoginPresenter extends GetxController {
  final Validation validation;
  final Authentication authentication;

  String? _email;
  String? _password;

  final emailError = Rx<String?>(null);
  final passwordError = Rx<String?>(null);
  final mainError = Rx<String?>(null);
  final isFormValid = RxBool(false);
  final isLoading = RxBool(false);

  GetxLoginPresenter(this.validation, this.authentication);

  void validateEmail(String email) {
    _email = email;
    emailError.value = _validateField('email');
    _validateForm();
  }

  String? _validateField(String field) {
    final formData = {
      'email': _email,
      'password': _password,
    };
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField:
        return '$field invalido';
      case ValidationError.requiredField:
        return 'Campo obrigatório';
      default:
        return null;
    }
  }

  void validatePassword(String password) {
    _password = password;
    emailError.value = _validateField('password');
    _validateForm();
  }

  void _validateForm() {
    isFormValid.value = emailError.value == null && passwordError.value == null && _email != null && _password != null;
  }

  Future<void> auth() async {
    isLoading.value = true;
    try {
      await authentication.auth(AuthenticationParams(email: _email!, password: _password!));
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          mainError.value = 'Credenciais inválidas';
          break;
        default:
          mainError.value = 'Erro estranho';
          break;
      }
      print(error);
    }
    isLoading.value = false;
  }
}
