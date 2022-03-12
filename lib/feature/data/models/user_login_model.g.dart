// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginModel _$UserLoginModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UserLoginModel',
      json,
      ($checkedConvert) {
        final val = UserLoginModel(
          accessKey: $checkedConvert('access_key', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'accessKey': 'access_key'},
    );

Map<String, dynamic> _$UserLoginModelToJson(UserLoginModel instance) =>
    <String, dynamic>{
      'access_key': instance.accessKey,
    };
