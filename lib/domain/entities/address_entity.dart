import 'package:amigo_fiel/utils/format_cep.dart';

class AddressEntity {
  final String id;
  final String street;
  final String number;
  final String block;
  final String cep;

  AddressEntity({
    required this.id,
    required this.street,
    required this.number,
    required this.block,
    required this.cep,
  });

  factory AddressEntity.fromJson(Map<String, dynamic> json) {
    return AddressEntity(
      id: json['id'],
      street: json['street'],
      number: json['number'],
      block: json['block'],
      cep: formatCEP(json['cep']),
    );
  }

  AddressEntity toEntity() {
    return AddressEntity(
      id: id,
      street: street,
      number: number,
      block: block,
      cep: cep,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['street'] = street;
    data['number'] = number;
    data['block'] = block;
    data['cep'] = cep;

    return data;
  }
}
