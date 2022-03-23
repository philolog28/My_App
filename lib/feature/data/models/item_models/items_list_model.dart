import 'package:commerce_app/feature/data/models/item_models/item_model.dart';
import 'package:commerce_app/feature/data/models/item_models/pagination_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'items_list_model.g.dart';

@JsonSerializable()
class ListItemsModel{
  ListItemsModel({
    required this.items,
    required this.pagination,
});
  List<ItemsModel>? items;
  PaginationModel? pagination;

  factory ListItemsModel.fromJson(Object? json) =>
      _$ListItemsModelFromJson(json as Map<String,dynamic>);
  Map<String,dynamic> toJson()=> _$ListItemsModelToJson(this);
}