// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketUserModel _$BasketUserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BasketUserModel',
      json,
      ($checkedConvert) {
        final val = BasketUserModel(
          id: $checkedConvert('id', (v) => v as int?),
          accessKey: $checkedConvert('access_key', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'accessKey': 'access_key'},
    );

Map<String, dynamic> _$BasketUserModelToJson(BasketUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'access_key': instance.accessKey,
    };
