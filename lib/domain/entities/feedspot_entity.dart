import 'package:amigo_fiel/domain/entities/entities.dart';
import 'package:amigo_fiel/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FeedspotEntity {
  String id;
  bool isFull;
  UserEntity? filledBy;
  UserEntity? createdBy;
  double latitude;
  double longitude;
  String landmark;
  AddressEntity? address;
  String fullAddress;
  List<UserEntity>? likedBy;
  List<ImageEntity>? images;
  CompanyEntity? sponsoredBy;
  FeedspotEntity({
    required this.id,
    required this.isFull,
    this.filledBy,
    this.createdBy,
    required this.latitude,
    required this.longitude,
    required this.landmark,
    required this.likedBy,
    this.images,
    this.sponsoredBy,
    this.address,
    required this.fullAddress,
  });

  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }

  factory FeedspotEntity.fromJson(Map<String, dynamic> json) {
    return FeedspotEntity(
      id: json['id'],
      isFull: json['isFull'],
      filledBy: null,
      createdBy: null,
      latitude: json['latitude'],
      longitude: json['longitude'],
      landmark: json['landmark'],
      likedBy: json['likedBy'] != null
          ? List<UserEntity>.from(json['likedBy'].map((userJson) => UserEntity.fromJson(userJson)))
          : null,
      sponsoredBy: null,
      images: json['images'] != null
          ? List<ImageEntity>.from(json['images'].map((image) => ImageEntity.fromJson(image)))
          : null,
      address: json['address'] != null ? AddressEntity.fromJson(json['address']) : null,
      fullAddress: getFullAddress(json['address']),
    );
  }

  FeedspotEntity toEntity() {
    return FeedspotEntity(
      id: id,
      isFull: isFull,
      filledBy: filledBy != null ? filledBy!.toEntity() : null,
      createdBy: createdBy != null ? createdBy!.toEntity() : null,
      latitude: latitude,
      longitude: longitude,
      landmark: landmark,
      address: address != null ? address!.toEntity() : null,
      fullAddress: fullAddress,
      likedBy: likedBy != null ? likedBy!.map((user) => user.toEntity()).toList() : null,
      images: images != null ? images!.map((image) => image.toEntity()).toList() : [],
      sponsoredBy: sponsoredBy != null ? sponsoredBy!.toEntity() : null,
    );
  }

  static List<FeedspotEntity> toList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => FeedspotEntity.fromJson(json)).toList();
  }

  static String getFullAddress(Map<String, dynamic> json) {
    if (json['id'] != null) {
      return "${json['street']} ${json['number']} \n${formatCEP(json['cep'])} ${json['block']}";
    }
    return '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isFull'] = isFull;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['landmark'] = landmark;
    data['fullAddress'] = fullAddress;

    if (filledBy != null) {
      data['filledBy'] = filledBy!.toJson();
    }

    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }

    if (likedBy != null) {
      data['likedBy'] = likedBy!.map((user) => user.toJson()).toList();
    }

    if (sponsoredBy != null) {
      data['sponsoredBy'] = sponsoredBy!.toJson();
    }

    if (address != null) {
      data['address'] = address!.toJson();
    }

    return data;
  }
}
