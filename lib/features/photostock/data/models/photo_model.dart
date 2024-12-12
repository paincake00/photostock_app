import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';

class ElementModel extends PhotoEntity {
  ElementModel({
    super.url,
    super.username,
    super.likes,
    super.color,
    super.blurHash,
  });

  factory ElementModel.fromJson(Map<String, dynamic> json) {
    return ElementModel(
      url: json['urls']['regular'] ?? "",
      username: json['user']['username'] ?? "",
      likes: json['likes'] ?? "",
      color: json['color'] ?? "",
      blurHash: json['blur_hash'] ?? "",
    );
  }
}
