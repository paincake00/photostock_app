/// [PhotoEntity] class is an abstract class which is used to define the structure of the photo entity.
class PhotoEntity {
  /// Photo URL
  final String? url;

  /// Username
  final String? username;

  /// Likes
  final int? likes;

  /// Color
  final String? color;

  /// Blur hash
  final String? blurHash;

  PhotoEntity({
    this.url,
    this.username,
    this.likes,
    this.color,
    this.blurHash,
  });
}
