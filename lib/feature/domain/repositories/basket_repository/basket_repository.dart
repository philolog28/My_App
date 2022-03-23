
import 'package:commerce_app/feature/domain/entities/basket_entities/get_basket_entity.dart';

abstract class BasketRepository{
  Future <BasketEntity?>? getBasket(){}


  Future <bool>? postToBasket({required int? productId}){}
  Future <bool>? deleteFromBasket({required int? productId}){}

  Future <bool>? changeQuantity({required int? productId,required int? quantity}){}

}