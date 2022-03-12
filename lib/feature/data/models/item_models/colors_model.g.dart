// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorsModel _$ColorsModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ColorsModel',
      json,
      ($checkedConvert) {
        final val = ColorsModel(
          id: $checkedConvert('id', (v) => v as int?),
          title: $checkedConvert('title', (v) => v as String?),
          code: $checkedConvert('code', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ColorsModelToJson(ColorsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'code': instance.code,
    };
