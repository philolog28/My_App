import 'dart:async';
import 'dart:convert';

import 'package:commerce_app/feature/data/data_sources/store.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/basket_mapper.dart';
import 'package:commerce_app/feature/data/models/basket_model.dart';
import 'package:commerce_app/feature/domain/entities/basket_entities/get_basket_entity.dart';
import 'package:commerce_app/feature/domain/repositories/basket_repository/basket_repository.dart';
import 'package:http/http.dart' as http;

class GetBasketRequestFailure implements Exception {}

class GetBasketNotFoundFailure implements Exception {}

class BasketRepositoryImpl implements BasketRepository {
  static const _baseUrl = 'vue-study.skillbox.cc';

  const BasketRepositoryImpl(
      this._basketMapper, this._store);

  final BasketMapper _basketMapper;

  final Store _store;

  @override
  Future<BasketEntity?>? getBasket() async {
    final getBasketRequest = Uri.https(_baseUrl, '/api/baskets',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final getBasketResponse = await http.get(getBasketRequest);
    var getBasket = BasketModel.fromJson(json.decode(getBasketResponse.body));
    if (getBasketResponse.statusCode != 200) {
      throw GetBasketRequestFailure();
    }
    final basket = _basketMapper.map(getBasket);
    return basket;
  }

  @override
  Future <bool>? changeQuantity({required productId,required quantity}) async{
    final completer =Completer<bool>();
    final putRequest = Uri.https(_baseUrl, '/api/baskets/products',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final putResponse = await http.put(putRequest,
        body: {'productId': '$productId', 'quantity': '$quantity'});
    completer.complete(true);
    if (putResponse.statusCode != 200) {
      throw GetBasketRequestFailure();
    }
    return completer.future;
  }

  @override
  Future<bool>? postToBasket({required productId}) async {
    final completer =Completer<bool>();
    final postRequest = Uri.https(_baseUrl, '/api/baskets/products',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final postResponse = await http.post(postRequest,
        body: {'productId': '$productId', 'quantity': '1'});
    if (postResponse.statusCode != 200) {
      throw GetBasketRequestFailure();
    }
    return completer.future;
  }

  @override
  Future<bool>? deleteFromBasket({required int? productId})  async{
    final completer =Completer<bool>();
    final deleteRequest = Uri.https(_baseUrl, '/api/baskets/products',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final deleteResponse = await http.delete(deleteRequest,
        body: {'productId': '$productId'});
    completer.complete(true);
    if (deleteResponse.statusCode != 200) {
      throw GetBasketRequestFailure();
    }
    return completer.future;
  }
}

