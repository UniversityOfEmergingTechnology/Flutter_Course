// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) => LoginInfo(
      username: json['username'] as String,
      password: json['password'] as String,
      salt: json['salt'] as String,
      uuid: json['uuid'] as String,
      md5: json['md5'] as String,
      sha256: json['sha256'] as String,
      sha1: json['sha1'] as String,
    );

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'username': instance.username,
      'password': instance.password,
      'salt': instance.salt,
      'md5': instance.md5,
      'sha1': instance.sha1,
      'sha256': instance.sha256,
    };
