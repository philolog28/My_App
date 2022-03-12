import 'package:commerce_app/feature/domain/entities/item_entities/item_entity.dart';

abstract class ItemCardRepository{
  Future <Items?> getItemCard({required int? productId});
}