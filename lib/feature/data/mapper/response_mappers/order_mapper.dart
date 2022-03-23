import 'package:commerce_app/feature/data/mapper/response_mappers/basket_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/colors_mapper.dart';
import 'package:commerce_app/feature/data/models/order_model.dart';
import 'package:commerce_app/feature/domain/entities/order_entities/order_entity.dart';


import '../mapper.dart';

class OrderMapper extends Mapper<OrderModel, OrderEntity> {
  OrderMapper({required this.colorsResponseMapper,required this.basketMapper});

  final ColorsResponseMapper colorsResponseMapper;
  final BasketMapper basketMapper;

  @override
  OrderEntity? map(OrderModel? entity) {
    return OrderEntity(
      id: entity?.id ?? 0,
      name:  entity?.name ?? '',
      address:  entity?.address ?? '',
      phone:  entity?.phone ?? '',
      email:  entity?.email ?? '',
      basket:  basketMapper.map(entity?.basket),
      totalPrice: entity?.totalPrice,
      comment:  entity?.comment ?? '',
      status:  colorsResponseMapper.map(entity?.status),
    );
  }
}
