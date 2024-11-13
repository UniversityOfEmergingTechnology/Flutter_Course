import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

part 'picture_model.g.dart';


@JsonSerializable()
class Picture{
  Picture({required this.thumbnail, required this.medium, required this.large});
  String large, medium, thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);
}
