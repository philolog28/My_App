part of 'item_cubit.dart';

enum ItemListLoadingStatus { initial, loading, success, failure }

extension ItemListLoadingStatusX on ItemListLoadingStatus {
  bool get isInitial => this == ItemListLoadingStatus.initial;

  bool get isLoading => this == ItemListLoadingStatus.loading;

  bool get isSuccess => this == ItemListLoadingStatus.success;

  bool get isFailure => this == ItemListLoadingStatus.failure;
}

class ItemsState extends Equatable {
  ItemsState({
    this.status = ItemListLoadingStatus.initial,
    this.items,
  });

  final ItemListLoadingStatus status;
  final ListItemEnt? items;

  ItemsState copyWith({
    ItemListLoadingStatus? status,
    ListItemEnt? items,
  }) {
    return ItemsState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, items];
}
