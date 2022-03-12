// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_item_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortItemListModel _$SortItemListModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SortItemListModel',
      json,
      ($checkedConvert) {
        final val = SortItemListModel(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => SortItemsModel.fromJson(e as Object))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$SortItemListModelToJson(SortItemListModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
