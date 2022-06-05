import 'package:commerce_app/feature/domain/entities/order_entities/order_entity.dart';

abstract class OrderRepository {
  Future<OrderEntity?>? createOrder(
      {required String? name,
      required String? address,
      required String? phone,
      required String? email,
      required String? comment});

  Future<OrderEntity?>? getOrderInfo({ required String? orderId});
}
