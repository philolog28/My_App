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
              (v) => (v as List<dynamic>)
                  .map((e) => ItemsModel.fromJson(e as Object))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ListItemsModelToJson(ListItemsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
