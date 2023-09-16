import 'package:amigo_fiel/presentation/protocols/validation.dart';
import 'package:amigo_fiel/validation/protocols/fields_validation.dart';
import 'package:equatable/equatable.dart';

class EmailValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const EmailValidation(this.field);

  @override
  ValidationError? validate(Map input) {
    final regex = RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$");
    final isValid = input[field]?.isNotEmpty != true || regex.hasMatch(input[field]);
    return isValid ? null : ValidationError.invalidField;
  }
}
