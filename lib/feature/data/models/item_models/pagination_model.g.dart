// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PaginationModel',
      json,
      ($checkedConvert) {
        final val = PaginationModel(
          page: $checkedConvert('page', (v) => v as int?),
          pages: $checkedConvert('pages', (v) => v as int?),
          total: $checkedConvert('total', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pages': instance.pages,
      'total': instance.total,
    };
