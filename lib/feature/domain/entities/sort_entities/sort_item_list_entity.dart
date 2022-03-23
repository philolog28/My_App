import 'package:equatable/equatable.dart';

import 'sort_item_entity.dart';


class SortItemListEnt extends Equatable{
  final List<SortItemsEnt> items;
  SortItemListEnt({required this.items});
  @override
  List<Object?> get props => [items];
}