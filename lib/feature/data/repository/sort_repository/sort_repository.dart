import 'dart:convert';

import 'package:commerce_app/feature/data/mapper/response_mappers/list_item_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/sort_item_list_mapper.dart';
import 'package:commerce_app/feature/data/models/item_models/items_list_model.dart';
import 'package:commerce_app/feature/data/models/sort_item_list_model.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/list_item_entity.dart';
import 'package:commerce_app/feature/domain/entities/sort_entities/sort_item_list_entity.dart';
import 'package:commerce_app/feature/domain/repositories/sort_items_repository/sort_items_repository.dart';
import 'package:http/http.dart' as http;

class SortRequestFailure implements Exception {}

class SortNotFoundFailure implements Exception {}

class SortItemRepositoryImpl implements SortItemRepository {
  static const _baseUrl = 'vue-study.skillbox.cc';

  const SortItemRepositoryImpl(this._sortListItemMapper,this._listItemMapper);

  final SortListItemMapper _sortListItemMapper;
  final ListItemMapper _listItemMapper;

  @override
  Future <SortItemListEnt?> getAllCategories() async {
    final sortCategoriesRequest = Uri.https(_baseUrl, '/api/productCategories');
    final sortCategoriesResponse = await http.get(sortCategoriesRequest);
    var _response = SortItemListModel.fromJson(json.decode(sortCategoriesResponse.body));
    if (sortCategoriesResponse.statusCode != 200) {
      throw SortRequestFailure();
    }
    final sortCategories = _sortListItemMapper.map(_response);
    return sortCategories;
  }

  @override
  Future<ListItemEnt?>? getAllItemsFromCategory({required int? categoryId}) async{
    final sortedCategoryRequest = Uri.https(
        _baseUrl,
        '/api/products',
        <String,String>{'categoryId':'$categoryId'}
    );
    final sortedCategoryResponse = await http.get(sortedCategoryRequest);
    var _response = ListItemsModel.fromJson(json.decode(sortedCategoryResponse.body));
    if (sortedCategoryResponse.statusCode != 200) {
      throw SortRequestFailure();
    }
    final sortedCategories = _listItemMapper.map(_response);
    return sortedCategories;
  }
  }


