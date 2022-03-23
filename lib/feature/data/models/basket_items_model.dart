import 'package:commerce_app/feature/data/models/item_models/item_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'basket_items_model.g.dart';

@JsonSerializable()
class BasketItemsModel{
  BasketItemsModel({
    required this.product,
    required this.id,
    required this.price,
    required this.quantity
  });
  final ItemsModel? product;
  final int? id;
  final double? price;
  final int? quantity;

  factory BasketItemsModel.fromJson(Object? json) =>
      _$BasketItemsModelFromJson(json as Map<String,dynamic>);
  Map<String,dynamic> toJson()=> _$BasketItemsModelToJson(this);
}