import 'package:json_annotation/json_annotation.dart';

part 'user_login_model.g.dart';

@JsonSerializable()
class UserLoginModel {
  UserLoginModel({
    this.accessKey,
  });

  final String? accessKey;

  factory UserLoginModel.fromJson(Object? json) =>
      _$UserLoginModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$UserLoginModelToJson(this);
}
