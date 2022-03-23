import 'package:commerce_app/feature/domain/entities/item_entities/item_entity.dart';
import 'package:equatable/equatable.dart';

import 'get_user_for_get_basket.dart';
import 'basket_items.dart';

class BasketEntity extends Equatable{
  const BasketEntity({
   required this.items,
   required this.user,
});
  final List<BasketItemsEnt>? items;
  final UserInformationEnt? user;

  @override
  List<Object?> get props => [items,user];

  BasketEntity copyWith({
    List<BasketItemsEnt>? items,
    UserInformationEnt? user,

  }) {
    return BasketEntity(
      items: items ?? this.items,
      user: user ?? this.user,
    );
  }
}