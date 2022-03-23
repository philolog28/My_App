// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketItemsModel _$BasketItemsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BasketItemsModel',
      json,
      ($checkedConvert) {
        final val = BasketItemsModel(
          product: $checkedConvert('product',
              (v) => v == null ? null : ItemsModel.fromJson(v as Object)),
          id: $checkedConvert('id', (v) => v as int?),
          price: $checkedConvert('price', (v) => (v as num?)?.toDouble()),
          quantity: $checkedConvert('quantity', (v) => v as int?),
        );
        return val;
      },
    );

Map<String, dynamic> _$BasketItemsModelToJson(BasketItemsModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'id': instance.id,
      'price': instance.price,
      'quantity': instance.quantity,
    };
