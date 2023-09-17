class BadgeEntity {
  final String id;
  final String name;
  final String description;
  final int threshold;
  final String imageUrl;

  BadgeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.threshold,
    required this.imageUrl,
  });

  factory BadgeEntity.fromJson(Map<String, dynamic> json) {
    return BadgeEntity(
      id: json['id']! as String,
      name: json['name']! as String,
      description: json['description']! as String,
      threshold: json['threshold']! as int,
      imageUrl: json['imageUrl']! as String,
    );
  }
}
