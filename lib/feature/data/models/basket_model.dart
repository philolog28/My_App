
import 'package:json_annotation/json_annotation.dart';

import 'basket_items_model.dart';
import 'basket_user_model.dart';

part 'basket_model.g.dart';

@JsonSerializable()
class BasketModel{
  BasketModel({
    required this.items,
    required this.user
  });
  final List<BasketItemsModel> items;
  final BasketUserModel user;


  factory BasketModel.fromJson(Object? json) =>
      _$BasketModelFromJson(json as Map<String,dynamic>);
  Map<String,dynamic> toJson()=> _$BasketModelToJson(this);
}