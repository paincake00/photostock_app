// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      url: json['url'] as String?,
      username: json['username'] as String?,
      likes: (json['likes'] as num?)?.toInt(),
      color: json['color'] as String?,
      blurHash: json['blurHash'] as String?,
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'username': instance.username,
      'likes': instance.likes,
      'color': instance.color,
      'blurHash': instance.blurHash,
    };
