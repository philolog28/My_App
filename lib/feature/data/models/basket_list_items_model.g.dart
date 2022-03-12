// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_list_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketListItemsModel _$BasketListItemsModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'BasketListItemsModel',
      json,
      ($checkedConvert) {
        final val = BasketListItemsModel(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => BasketItemsModel.fromJson(e as Object))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$BasketListItemsModelToJson(
        BasketListItemsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
