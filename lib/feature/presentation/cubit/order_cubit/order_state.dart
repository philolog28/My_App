part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderLoadingState extends OrderState {
  const OrderLoadingState();
}



class OrderLoadedState extends OrderState{
  const OrderLoadedState({required this.order});

  final OrderEntity? order;

  @override
  List<Object?> get props => [order];
}


class ErrorState extends OrderState{
   const ErrorState();
}