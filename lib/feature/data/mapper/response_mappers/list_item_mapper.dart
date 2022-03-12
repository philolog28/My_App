import 'package:commerce_app/feature/data/mapper/response_mappers/items_mapper.dart';
import 'package:commerce_app/feature/data/models/item_models/items_list_model.dart';
import 'package:commerce_app/feature/data/models/item_models/item_model.dart';

import 'package:commerce_app/feature/domain/entities/item_entities/list_item_entity.dart';

import '../mapper.dart';

class ListItemMapper extends Mapper<ListItemsModel, ListItemEnt> {
  ListItemMapper({required this.categoryResponseMapper});

  final ItemResponseMapper categoryResponseMapper;

  @override
  ListItemEnt? map(ListItemsModel? entity) {
    final List<ItemsModel>? items = entity?.items;
    return ListItemEnt(
      items: items != null ? categoryResponseMapper.mapList(entity?.items) : [],
    );
  }
}
