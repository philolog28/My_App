import 'package:commerce_app/feature/data/models/basket_model.dart';
import 'package:commerce_app/feature/data/models/item_models/colors_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel{
  OrderModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.basket,
    this.totalPrice,
    this.comment,
    this.status,
  });
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final BasketModel? basket;
  final double? totalPrice;
  final String? comment;
  final ColorsModel? status;

  factory OrderModel.fromJson(Object? json) =>
      _$OrderModelFromJson(json as Map<String,dynamic>);
  Map<String,dynamic> toJson()=> _$OrderModelToJson(this);
}