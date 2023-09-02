import 'package:amigo_fiel/presentation/protocols/protocols.dart';

abstract class FieldValidation {
  String get field;
  ValidationError? validate(Map input);
}
