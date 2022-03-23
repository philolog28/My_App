import 'package:bloc/bloc.dart';
import 'package:commerce_app/feature/domain/entities/order_entities/order_entity.dart';
import 'package:commerce_app/feature/domain/repositories/order_repository/order_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepository) : super(OrderLoadingState());

  final OrderRepository orderRepository;

  Future<void> createOrder(
      {required String? name,
      required String? address,
      required String? phone,
      required String? email,
      required String? comment}) async {
    emit(OrderLoadingState());
    try {
      final orderResponse = await orderRepository.createOrder(
          name: name,
          address: address,
          phone: phone,
          email: email,
          comment: comment);
      emit(OrderLoadedState(order: orderResponse));
    }catch(e){
      emit( const ErrorState());
    }
  }
  Future<void> getOrderInfo({required orderId}) async{
    emit( OrderLoadingState());
    try{
      final orderInfo = await orderRepository.getOrderInfo(orderId: orderId);
      emit(OrderLoadedState(order: orderInfo));
    }catch(e){
      emit(const ErrorState());
    }
  }
}
