// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'OrderModel',
      json,
      ($checkedConvert) {
        final val = OrderModel(
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          address: $checkedConvert('address', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          basket: $checkedConvert('basket',
              (v) => v == null ? null : BasketModel.fromJson(v as Object)),
          totalPrice:
              $checkedConvert('total_price', (v) => (v as num?)?.toDouble()),
          comment: $checkedConvert('comment', (v) => v as String?),
          status: $checkedConvert('status',
              (v) => v == null ? null : ColorsModel.fromJson(v as Object)),
        );
        return val;
      },
      fieldKeyMap: const {'totalPrice': 'total_price'},
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'basket': instance.basket,
      'total_price': instance.totalPrice,
      'comment': instance.comment,
      'status': instance.status,
    };
