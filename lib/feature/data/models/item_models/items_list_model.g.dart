// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListItemsModel _$ListItemsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListItemsModel',
      json,
      ($checkedConvert) {
        final val = ListItemsModel(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => ItemsModel.fromJson(e as Object))
                  .toList()),
          pagination: $checkedConvert('pagination',
              (v) => v == null ? null : PaginationModel.fromJson(v as Object)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ListItemsModelToJson(ListItemsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'pagination': instance.pagination,
    };
