enum UIError { requiredField, invalidField, unexpected, invalidCredentials, emailInUse }

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.requiredField:
        return 'requiredField';
      case UIError.invalidField:
        return 'invalidField';
      case UIError.invalidCredentials:
        return 'invalidCredentials';
      case UIError.emailInUse:
        return 'emailInUse';
      default:
        return 'msgUnexpectedError';
    }
  }
}
