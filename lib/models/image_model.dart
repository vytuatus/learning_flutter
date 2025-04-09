class PixelformImage {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? thumbnailUrl;
  String? createdAt;
  String? updatedAt;

  PixelformImage({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.thumbnailUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory PixelformImage.fromJson(Map<String, dynamic> json) {
    return PixelformImage(
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