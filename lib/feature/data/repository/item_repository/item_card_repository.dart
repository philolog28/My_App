import 'dart:convert';
import 'package:commerce_app/feature/data/models/item_models/item_model.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/items_mapper.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';
import 'package:commerce_app/feature/domain/repositories/item_card_repository/item_card_repository.dart';
import 'package:http/http.dart' as http;

class ItemCardRequestFailure implements Exception {}

class ItemCardNotFoundFailure implements Exception {}

class ItemCardRepositoryImpl implements ItemCardRepository {
  static const _baseUrl = 'vue-study.skillbox.cc';

  const ItemCardRepositoryImpl(this._listItemMapper);

  final ItemResponseMapper _listItemMapper;

  @override
  Future <Items?> getItemCard({required int? productId}) async {
    final ItemCardRequest = Uri.https(
        _baseUrl, 
        '/api/products/${productId.toString()}',);
    final ItemCardResponse = await http.get(ItemCardRequest);
    var _response = ItemsModel.fromJson(json.decode(ItemCardResponse.body));
    if (ItemCardResponse.statusCode != 200) {
      throw ItemCardRequestFailure();
    }

    final ItemCard = _listItemMapper.map(_response);
    return ItemCard;
  }



}
