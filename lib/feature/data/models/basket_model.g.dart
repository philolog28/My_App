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
          id: $checkedConvert('id', (v) => v as int?),
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      e == null ? null : ListItemsModel.fromJson(e as Object))
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
      'id': instance.id,
      'user': instance.user,
    };
