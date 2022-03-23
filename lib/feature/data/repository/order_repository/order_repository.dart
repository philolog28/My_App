import 'dart:async';
import 'dart:convert';

import 'package:commerce_app/feature/data/data_sources/store.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/order_mapper.dart';
import 'package:commerce_app/feature/data/models/order_model.dart';
import 'package:commerce_app/feature/domain/entities/order_entities/order_entity.dart';
import 'package:commerce_app/feature/domain/repositories/order_repository/order_repository.dart';
import 'package:http/http.dart' as http;

class CreateOrderRequestFailure implements Exception {}

class CreateOrderNotFoundFailure implements Exception {}

class GetOrderRequestFailure implements Exception {}

class GetOrderNotFoundFailure implements Exception {}

class OrderRepositoryImpl implements OrderRepository {
  static const _baseUrl = 'vue-study.skillbox.cc';

  const OrderRepositoryImpl(this._orderMapper, this._store);

  final OrderMapper _orderMapper;

  final Store _store;

  @override
  Future<OrderEntity?>? createOrder(
      {required name,
      required address,
      required phone,
      required email,
      required comment}) async {
    final createOrderRequest = Uri.https(_baseUrl, '/api/orders',
        <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
    final createOrderResponse = await http.post(createOrderRequest, body: {
      'name': '$name',
      'address': '$address',
      'phone': '$phone',
      'email': '$email',
      'comment': '$comment'
    });
    var createOrder =
        OrderModel.fromJson(json.decode(createOrderResponse.body));
    if (createOrderResponse.statusCode != 200) {
      throw CreateOrderRequestFailure();
    }
    final orderCreated = _orderMapper.map(createOrder);
    return orderCreated;
  }

  @override
  Future<OrderEntity?>? getOrderInfo({required orderId}) async {
    try{
      final getOrderRequest = Uri.https(_baseUrl, '/api/orders/$orderId}',
          <String, String>{'userAccessKey': '${_store.getAccessKey()}'});
      final getOrderResponse = await http.get(getOrderRequest);
      var order = OrderModel.fromJson(json.decode(getOrderResponse.body));
      if (getOrderResponse.statusCode != 200) {
        throw GetOrderRequestFailure();
      }
      final getOrder = _orderMapper.map(order);
      return getOrder;
    }catch(e){
      print(e);
    }

  }
}
