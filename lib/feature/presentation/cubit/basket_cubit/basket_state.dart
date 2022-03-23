part of 'basket_cubit.dart';

enum BasketLoadingStatus { initial, loading, success, failure }

extension BasketLoadingStatusX on BasketLoadingStatus {
  bool get isInitial => this == BasketLoadingStatus.initial;

  bool get isLoading => this == BasketLoadingStatus.loading;

  bool get isSuccess => this == BasketLoadingStatus.success;

  bool get isFailure => this == BasketLoadingStatus.failure;
}

class BasketState extends Equatable {
  BasketState({
    this.basket = true,
    this.status = BasketLoadingStatus.initial,
    this.items,
  });

  final BasketLoadingStatus? status;
  bool? basket;
  final BasketEntity? items;

  BasketState copyWith({
    BasketLoadingStatus? status,
    bool? basket,
    BasketEntity? items,
  }) {
    return BasketState(
      basket: basket ?? this.basket,
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, items];
}

class BasketProductsState extends BasketState {
  BasketProductsState({required this.productId});

  final int? productId;
  @override
  List<Object?> get props => [productId];
}
class BasketClearState extends BasketState{
  BasketClearState();
}

class CounterLoadingState extends BasketState{
   CounterLoadingState();
}

class StopCounterLoadingState extends BasketState{
  StopCounterLoadingState();
}
class LoadingState extends BasketState{
   LoadingState();
}
class LoadedState extends BasketState{
   LoadedState({required this.items});
  final BasketEntity? items;
  @override
  List<Object?> get props => [items];
}
class PuttingLoadingState extends BasketState{
  PuttingLoadingState();
}

class StopPuttingLoadingState extends BasketState {
  StopPuttingLoadingState();
}
class ErrorState extends BasketState{
  ErrorState();
}
class BasketEmpty extends BasketState{
  BasketEmpty();
}


