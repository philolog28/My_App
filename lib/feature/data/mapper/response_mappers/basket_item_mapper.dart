import 'package:commerce_app/feature/data/mapper/response_mappers/items_mapper.dart';
import 'package:commerce_app/feature/data/models/basket_items_model.dart';
import 'package:commerce_app/feature/domain/entities/basket_entities/basket_items.dart';


import '../mapper.dart';

class BasketItemMapper extends Mapper<BasketItemsModel, BasketItemsEnt> {
  BasketItemMapper({required this.itemResponseMapper});

  final ItemResponseMapper itemResponseMapper;

  @override
  BasketItemsEnt? map(BasketItemsModel? entity) {
    return BasketItemsEnt(
      id: entity?.id,
      quantity: entity?.quantity,
      price: entity?.price,
      product: itemResponseMapper.map(entity?.product),
    );
  }
}
