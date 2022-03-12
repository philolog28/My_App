import 'package:commerce_app/feature/data/models/item_models/items_list_model.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';
import 'package:equatable/equatable.dart';


class ListBasketItemsEnt extends Equatable{
  final List<Items> items;
  final int? id;
  final double? price;
  final  int? quantity;
  ListBasketItemsEnt({
    required this.items,
    required this.id,
    required this.price,
    required this.quantity,
  });
  @override
  List<Object?> get props => [items,id,price,quantity];
}