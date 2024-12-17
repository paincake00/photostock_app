import 'package:json_annotation/json_annotation.dart';
import 'package:photostock_app/features/photostock/domain/entities/user_entity.dart';

part 'user_model.g.dart';

/// [UserModel] class is a model class which
@JsonSerializable()
class UserModel extends UserEntity {
  /// Username
  @JsonKey(name: 'username')
  final String username;

  UserModel({
    required this.username,
  }) : super(username: username);

  /// Create a [UserModel] instance from a JSON object
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
