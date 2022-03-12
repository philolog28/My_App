// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsModel _$ItemsModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ItemsModel',
      json,
      ($checkedConvert) {
        final val = ItemsModel(
          id: $checkedConvert('id', (v) => v as int?),
          title: $checkedConvert('title', (v) => v as String?),
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

Map<String, dynamic> _$ItemsModelToJson(ItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'image': instance.image,
      'price': instance.price,
      'colors': instance.colors,
    };
