// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Picture _$PictureFromJson(Map<String, dynamic> json) => Picture(
      thumbnail: json['thumbnail'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail,
    };
