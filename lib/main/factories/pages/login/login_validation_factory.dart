import 'package:amigo_fiel/main/builders/validation_builder.dart';
import 'package:amigo_fiel/presentation/protocols/protocols.dart';
import 'package:amigo_fiel/validation/protocols/protocols.dart';

import '../../../../validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite(_makeValidations());
}

List<FieldValidation> _makeValidations() {
  return [
    ...ValidationBuilder.field('email')!.required().email().build(),
    ...ValidationBuilder.field('password')!.required().build(),
  ];
}
