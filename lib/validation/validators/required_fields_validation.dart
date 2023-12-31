import 'package:amigo_fiel/presentation/protocols/validation.dart';
import 'package:equatable/equatable.dart';

import '../../validation/protocols/protocols.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const RequiredFieldValidation(this.field);

  @override
  ValidationError? validate(Map input) {
    return input[field]?.isNotEmpty == true ? null : ValidationError.requiredField;
  }
}
