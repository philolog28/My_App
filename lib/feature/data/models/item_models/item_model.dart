import 'package:json_annotation/json_annotation.dart';
import 'image_model.dart';
import 'colors_model.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemsModel{
  ItemsModel({this.id, this.title, this.slug, this.image, this.price, this.colors});

  final int? id;
  final String? title;
  final String? slug;
  final ImageModel? image;
  final double? price;
  final List<ColorsModel>? colors;

  factory ItemsModel.fromJson(Object? json) =>
      _$ItemsModelFromJson(json as Map<String,dynamic>);
  Map<String,dynamic> toJson() => _$ItemsModelToJson(this);
}