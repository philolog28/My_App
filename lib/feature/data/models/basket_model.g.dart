// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketModel _$BasketModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'BasketModel',
      json,
      ($checkedConvert) {
        final val = BasketModel(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => BasketItemsModel.fromJson(e as Object))
                  .toList()),
          user: $checkedConvert(
              'user', (v) => BasketUserModel.fromJson(v as Object)),
        );
        return val;
      },
    );

Map<String, dynamic> _$BasketModelToJson(BasketModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'user': instance.user,
    };
