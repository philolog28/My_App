import 'package:commerce_app/feature/data/models/item_models/items_list_model.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';
import 'package:equatable/equatable.dart';


class BasketItemsEnt extends Equatable{
  final Items? product;
  final int? id;
  final double? price;
  final  int? quantity;
  BasketItemsEnt({
    required this.product,
    required this.id,
    required this.price,
    required this.quantity,
  });
  @override
  List<Object?> get props => [product,id,price,quantity];
}