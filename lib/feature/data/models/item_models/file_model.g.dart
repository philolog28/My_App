// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'FileModel',
      json,
      ($checkedConvert) {
        final val = FileModel(
          url: $checkedConvert('url', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          originalName: $checkedConvert('original_name', (v) => v as String?),
          extension: $checkedConvert('extension', (v) => v as String?),
          size: $checkedConvert('size', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'originalName': 'original_name'},
    );

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'original_name': instance.originalName,
      'extension': instance.extension,
      'size': instance.size,
    };
