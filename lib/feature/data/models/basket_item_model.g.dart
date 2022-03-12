// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketItemsModel _$BasketItemsModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BasketItemsModel',
      json,
      ($checkedConvert) {
        final val = BasketItemsModel(
          id: $checkedConvert('id', (v) => v as int?),
          title: $checkedConvert('title', (v) => v as String?),
          quantity: $checkedConvert('quantity', (v) => v as int?),
          slug: $checkedConvert('slug', (v) => v as String?),
          image: $checkedConvert('image',
              (v) => v == null ? null : ImageModel.fromJson(v as Object)),
          price: $checkedConvert('price', (v) => (v as num?)?.toDouble()),
          colors: $checkedConvert(
              'colors',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => ColorsModel.fromJson(e as Object))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$BasketItemsModelToJson(BasketItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'quantity': instance.quantity,
      'slug': instance.slug,
      'image': instance.image,
      'price': instance.price,
      'colors': instance.colors,
    };
