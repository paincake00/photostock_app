/// [PhotoEntity] class is an abstract class which is used to define the structure of the photo entity.
class PhotoEntity {
  /// Photo URL
  final String url;

  /// Username
  final String username;

  /// Likes
  final int likes;

  /// Color
  final String color;

  /// Blur hash
  final String blurHash;

  PhotoEntity({
    required this.url,
    required this.username,
    required this.likes,
    required this.color,
    required this.blurHash,
  });
}
