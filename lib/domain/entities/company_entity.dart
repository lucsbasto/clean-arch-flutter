class CompanyEntity {
  final int id;
  final String name;
  final String description;
  final String logoUrl;
  final String websiteUrl;
  final String phoneNumber;
  final String address;

  CompanyEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.logoUrl,
    required this.websiteUrl,
    required this.phoneNumber,
  });

  factory CompanyEntity.fromJson(Map<String, dynamic> json) {
    return CompanyEntity(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      description: json['description'],
      logoUrl: json['logoUrl'],
      websiteUrl: json['websiteUrl'],
      phoneNumber: json['phoneNumber'],
    );
  }

  CompanyEntity toEntity() {
    return CompanyEntity(
      id: id,
      name: name,
      address: address,
      description: description,
      logoUrl: logoUrl,
      websiteUrl: websiteUrl,
      phoneNumber: phoneNumber,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['description'] = description;
    data['logoUrl'] = logoUrl;
    data['websiteUrl'] = websiteUrl;
    data['phoneNumber'] = phoneNumber;

    return data;
  }
}
