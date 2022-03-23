import 'package:json_annotation/json_annotation.dart';


part 'basket_user_model.g.dart';

@JsonSerializable()
class BasketUserModel{
  BasketUserModel({this.id, this.accessKey});

  final int? id;
  final String? accessKey;

  factory BasketUserModel.fromJson(Object? json) =>
      _$BasketUserModelFromJson(json as Map<String,dynamic>);
  Map<String,dynamic> toJson() => _$BasketUserModelToJson(this);
}