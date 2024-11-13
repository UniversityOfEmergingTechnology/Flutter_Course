import 'package:json_annotation/json_annotation.dart';

part 'log_in_info_model.g.dart';

@JsonSerializable()
class LoginInfo{
  LoginInfo({
    required this.username,
    required this.password,
    required this.salt,
    required this.uuid,
    required this.md5,
    required this.sha256,
    required this.sha1,
  });

  String uuid, username, password, salt, md5, sha1, sha256;

  factory LoginInfo.fromJson(Map<String, dynamic> json) => _$LoginInfoFromJson(json);

}