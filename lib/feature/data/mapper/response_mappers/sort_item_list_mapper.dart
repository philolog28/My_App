import 'package:commerce_app/feature/data/mapper/response_mappers/sort_item_mapper.dart';
import 'package:commerce_app/feature/data/models/sort_item_list_model.dart';
import 'package:commerce_app/feature/data/models/sort_item_model.dart';

import 'package:commerce_app/feature/domain/entities/sort_entities/sort_item_list_entity.dart';

import '../mapper.dart';

class SortListItemMapper extends Mapper<SortItemListModel, SortItemListEnt> {
  SortListItemMapper({required this.sortItemMapper});

  final SortItemMapper sortItemMapper;

  @override
  SortItemListEnt? map(SortItemListModel? entity) {
    final List<SortItemsModel>? items = entity?.items;
    return SortItemListEnt(
      items: items != null ? sortItemMapper.mapList(entity?.items) : [],
    );
  }
}
