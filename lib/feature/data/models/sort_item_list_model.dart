
import 'package:json_annotation/json_annotation.dart';

import 'sort_item_model.dart';

part 'sort_item_list_model.g.dart';

@JsonSerializable()
class SortItemListModel{
  SortItemListModel({
    required this.items,
  });
  List<SortItemsModel> items;

  factory SortItemListModel.fromJson(Object? json) =>
      _$SortItemListModelFromJson(json as Map<String,dynamic>);
  Map<String,dynamic> toJson()=> _$SortItemListModelToJson(this);
}