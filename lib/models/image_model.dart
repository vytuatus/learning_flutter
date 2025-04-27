class CustomImage {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? thumbnailUrl;
  final String? createdAt;
  final String? updatedAt;

  CustomImage({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.thumbnailUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomImage.fromJson(Map<String, dynamic> json) {
    return CustomImage(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
