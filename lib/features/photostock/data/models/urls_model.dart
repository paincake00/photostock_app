import 'package:json_annotation/json_annotation.dart';
import 'package:photostock_app/features/photostock/domain/entities/urls_entity.dart';

part 'urls_model.g.dart';

/// [UrlsModel] class is a model class which
@JsonSerializable()
class UrlsModel extends UrlsEntity {
  /// Regular URL
  @JsonKey(name: 'regular')
  final String regular;

  UrlsModel({
    required this.regular,
  }) : super(regular: regular);

  /// Create a [UrlsModel] instance from a JSON object
  factory UrlsModel.fromJson(Map<String, dynamic> json) =>
      _$UrlsModelFromJson(json);
}
