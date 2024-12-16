import 'package:photostock_app/features/photostock/domain/entities/urls_entity.dart';
import 'package:photostock_app/features/photostock/domain/entities/user_entity.dart';

/// [PhotoEntity] class is an abstract class which is used to define the structure of the photo entity.
class PhotoEntity {
  /// Photo URL
  final UrlsEntity url;

  /// Username
  final UserEntity user;

  /// Likes
  final int likes;

  /// Color
  final String color;

  /// Blur hash
  final String blurHash;

  PhotoEntity({
    required this.url,
    required this.user,
    required this.likes,
    required this.color,
    required this.blurHash,
  });
}
