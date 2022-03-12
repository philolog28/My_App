import 'package:commerce_app/feature/domain/entities/basket_entities/get_basket_entity.dart';
import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable{
  OrderEntity({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.basket,
    this.totalPrice,
    this.comment,
    this.status,
});
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final BasketEntity? basket;
  final double? totalPrice;
  final String? comment;
  final String? status;
  @override

  List<Object?> get props => [id,name,address,phone,email,basket,totalPrice,comment,status];
}