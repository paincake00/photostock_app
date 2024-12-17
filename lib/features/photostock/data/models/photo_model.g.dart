// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      url: UrlsModel.fromJson(json['urls'] as Map<String, dynamic>),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      likes: (json['likes'] as num).toInt(),
      color: json['color'] as String,
      blurHash: json['blur_hash'] as String,
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'urls': instance.url,
      'user': instance.user,
      'likes': instance.likes,
      'color': instance.color,
      'blur_hash': instance.blurHash,
    };
