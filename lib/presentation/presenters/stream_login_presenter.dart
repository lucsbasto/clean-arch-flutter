// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:amigo_fiel/data/usecases/remote_authentication.dart';
import 'package:amigo_fiel/domain/entities/entities.dart';
import 'package:amigo_fiel/ui/helpers/errors/ui_errors.dart';

import '../../domain/helpers/domain_error.dart';
import '../../ui/pages/login/login.dart';

import '../../domain/usecases/authentication.dart';
import '../protocols/validation.dart';

class LoginState {
  String? email;
  String? password;
  UIError? emailError;
  UIError? passwordError;
  UIError? mainError;
  bool isLoading = false;
  UserEntity? user;
  bool get isFormValid => emailError == null && passwordError == null && email != null && password != null;
}

class StreamLoginPresenter implements LoginPresenter {
  final Validation validation;
  final Authentication authentication;

  StreamLoginPresenter(this.validation, this.authentication);

  final _controller = StreamController<LoginState>.broadcast();
  final _state = LoginState();
  @override
  Stream<UIError?> get emailErrorStream => _controller.stream.map((state) => state.emailError).distinct();
  @override
  Stream<UIError?> get passwordErrorStream => _controller.stream.map((state) => state.passwordError).distinct();
  @override
  Stream<UIError?> get mainErrorStream => _controller.stream.map((state) => state.mainError).distinct();
  @override
  Stream<bool> get isFormValidStream => _controller.stream.map((state) => state.isFormValid).distinct();
  @override
  Stream<bool> get isLoadingStream => _controller.stream.map((state) => state.isLoading).distinct();

  void _update() => _controller.add(_state);

  @override
  void validateEmail(String email) {
    _state.email = email;
    _state.emailError = _validateField('email');
    _update();
  }

  UIError? _validateField(String field) {
    final formData = {
      'email': _state.email,
      'password': _state.password,
    };
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField:
        return UIError.invalidField;
      case ValidationError.requiredField:
        return UIError.requiredField;
      default:
        return null;
    }
  }

  @override
  void validatePassword(String password) {
    _state.password = password;
    _state.emailError = _validateField('password');
    _update();
  }

  @override
  Future<void> auth() async {
    _state.isLoading = true;
    _update();
    try {
      final user = await authentication.auth(AuthenticationParams(email: _state.email!, password: _state.password!));
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          _state.mainError = UIError.invalidCredentials;
          break;
        default:
          _state.mainError = UIError.unexpected;
          break;
      }
      print(error);
    }
    _state.isLoading = false;
    _update();
  }

  @override
  void dispose() {
    _controller.close();
  }
}
