import 'package:amigo_fiel/domain/entities/entities.dart';
import 'package:amigo_fiel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FeedSpotEntity {
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
  List<Image>? images;
  CompanyEntity? sponsoredBy;
  FeedSpotEntity({
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

  factory FeedSpotEntity.fromJson(Map<String, dynamic> json) {
    return FeedSpotEntity(
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
      address: json['address'] != null ? AddressEntity.fromJson(json['address']) : null,
      fullAddress: getFullAddress(json['address']),
    );
  }

  static String getFullAddress(Map<String, dynamic> json) {
    if (json['id'] != null) {
      return "${json['street']} ${json['number']} \n${formatCEP(json['cep'])} ${json['block']}";
    }
    return '';
  }
}
