import 'package:commerce_app/feature/data/mapper/response_mappers/basket_user_mapper.dart';
import 'package:commerce_app/feature/data/models/basket_items_model.dart';
import 'package:commerce_app/feature/data/models/basket_model.dart';
import 'package:commerce_app/feature/domain/entities/basket_entities/get_basket_entity.dart';


import '../mapper.dart';
import 'basket_item_mapper.dart';

class BasketMapper extends Mapper<BasketModel, BasketEntity> {
  BasketMapper({required this.basketItemMapper,required this.basketUserMapper});

  final BasketItemMapper basketItemMapper;
  final BasketUserMapper basketUserMapper;

  @override
  BasketEntity? map(BasketModel? entity) {
    final List<BasketItemsModel>? items = entity?.items;
    return BasketEntity(
      items: items != null ? basketItemMapper.mapList(entity?.items) : [],
      user: basketUserMapper.map(entity?.user),
    );
  }
}
