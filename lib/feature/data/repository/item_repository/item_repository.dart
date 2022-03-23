import 'dart:convert';

import 'package:commerce_app/constants.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/items_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/list_item_mapper.dart';
import 'package:commerce_app/feature/data/models/item_models/items_list_model.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/list_item_entity.dart';
import 'package:commerce_app/feature/domain/repositories/item_repository/item_repository.dart';
import 'package:http/http.dart' as http;

class ItemListRequestFailure implements Exception {}

class ItemListNotFoundFailure implements Exception {}

class ItemRepositoryImpl implements ItemRepository {
  static const _baseUrl = 'vue-study.skillbox.cc';

  const ItemRepositoryImpl(this._listItemMapper);

  final ListItemMapper _listItemMapper;

  @override
  Future <ListItemEnt?> getAllItems({required offset}) async {
    final listItemsRequest = Uri.https(_baseUrl, '/api/products',
    <String,String>{'page':'$offset','limit':'$paginationLimit'});
    final listItemsResponse = await http.get(listItemsRequest);
    var _response = ListItemsModel.fromJson(json.decode(listItemsResponse.body));
    if (listItemsResponse.statusCode != 200) {
      throw ItemListRequestFailure();
    }

    final listItems = _listItemMapper.map(_response);
    return listItems;
  }

  @override
  Future<List<Items>>? searchItem(String itemId) {
    throw UnimplementedError();
  }


}
