// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortItemsModel _$SortItemsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SortItemsModel',
      json,
      ($checkedConvert) {
        final val = SortItemsModel(
          id: $checkedConvert('id', (v) => v as int?),
          title: $checkedConvert('title', (v) => v as String?),
          slug: $checkedConvert('slug', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$SortItemsModelToJson(SortItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
    };
