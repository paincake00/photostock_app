import 'package:json_annotation/json_annotation.dart';
import 'package:photostock_app/features/photostock/data/models/urls_model.dart';
import 'package:photostock_app/features/photostock/data/models/user_model.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';

part 'photo_model.g.dart';

/// [PhotoModel] class is a model class which
/// is used to define the structure of the photo model.
@JsonSerializable()
class PhotoModel extends PhotoEntity {
  /// Photo URL
  @JsonKey(name: 'urls')
  final UrlsModel url;

  /// Username
  @JsonKey(name: 'user')
  final UserModel user;

  /// Likes
  @JsonKey(name: 'likes')
  final int likes;

  /// Color
  @JsonKey(name: 'color')
  final String color;

  /// Blur hash
  @JsonKey(name: 'blur_hash')
  final String blurHash;

  PhotoModel({
    required this.url,
    required this.user,
    required this.likes,
    required this.color,
    required this.blurHash,
  }) : super(
          url: url,
          user: user,
          likes: likes,
          color: color,
          blurHash: blurHash,
        );

  /// Create a [PhotoModel] instance from a JSON object
  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}
