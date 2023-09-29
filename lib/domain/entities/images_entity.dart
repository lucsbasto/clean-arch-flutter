// ignore: file_names
class ImageEntity {
  String id;
  String imageUrl;

  ImageEntity({
    required this.id,
    required this.imageUrl,
  });

  factory ImageEntity.fromJson(Map<String, dynamic> json) {
    return ImageEntity(id: json['id'], imageUrl: json['imageUrl']);
  }

  ImageEntity toEntity() {
    return ImageEntity(id: id, imageUrl: imageUrl);
  }

  static List<ImageEntity> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ImageEntity.fromJson(json)).toList();
  }
}
