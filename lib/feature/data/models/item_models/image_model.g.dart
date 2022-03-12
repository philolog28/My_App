// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ImageModel',
      json,
      ($checkedConvert) {
        final val = ImageModel(
          file: $checkedConvert('file',
              (v) => v == null ? null : FileModel.fromJson(v as Object)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'file': instance.file,
    };
