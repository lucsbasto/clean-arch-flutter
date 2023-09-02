import 'package:amigo_fiel/presentation/protocols/validation.dart';
import 'package:equatable/equatable.dart';

import '../../validation/protocols/protocols.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  final String field;

  List get props => [field];

  RequiredFieldValidation(this.field);

  @override
  ValidationError? validate(Map input) {
    return input[field]?.isNotEmpty == true ? null : ValidationError.requiredField;
  }
}
