// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amigo_fiel/validation/protocols/protocols.dart';
import 'package:amigo_fiel/validation/validators/validators.dart';

class ValidationBuilder {
  static ValidationBuilder? _instance;
  String fieldName;
  List<FieldValidation> validations = [];
  ValidationBuilder._(this.fieldName);

  static ValidationBuilder? field(String fieldName) {
    _instance = ValidationBuilder._(fieldName);
    return _instance;
  }

  ValidationBuilder required() {
    validations.add(RequiredFieldValidation(fieldName));
    return this;
  }

  ValidationBuilder email() {
    validations.add(EmailValidation(fieldName));
    return this;
  }

  List<FieldValidation> build() => validations;
}
