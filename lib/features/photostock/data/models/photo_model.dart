import 'package:json_annotation/json_annotation.dart';
import 'package:photostock_app/features/photostock/domain/entities/photo_entity.dart';

part 'photo_model.g.dart';

/// [PhotoModel] class is a model class which is used to define the structure of the photo model.
@JsonSerializable()
class PhotoModel extends PhotoEntity {
  PhotoModel({
    super.url,
    super.username,
    super.likes,
    super.color,
    super.blurHash,
  });

  /// Create a [PhotoModel] instance from a JSON object
  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}
