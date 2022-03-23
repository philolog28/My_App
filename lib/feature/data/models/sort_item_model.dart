import 'package:json_annotation/json_annotation.dart';


part 'sort_item_model.g.dart';

@JsonSerializable()
class SortItemsModel{
  SortItemsModel({this.id, this.title, this.slug});

  final int? id;
  final String? title;
  final String? slug;


  factory SortItemsModel.fromJson(Object? json) =>
      _$SortItemsModelFromJson(json as Map<String,dynamic>);
  Map<String,dynamic> toJson() => _$SortItemsModelToJson(this);
}