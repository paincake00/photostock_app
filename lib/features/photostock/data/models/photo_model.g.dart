// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      url: _fromJsonUrls(json['urls'] as Map<String, dynamic>),
      username: _fromJsonUser(json['user'] as Map<String, dynamic>),
      likes: (json['likes'] as num).toInt(),
      color: json['color'] as String,
      blurHash: json['blur_hash'] as String,
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'urls': instance.url,
      'user': instance.username,
      'likes': instance.likes,
      'color': instance.color,
      'blur_hash': instance.blurHash,
    };
