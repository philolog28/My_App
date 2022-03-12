part of 'item_card_cubit.dart';


enum ItemListLoadingStatus { initial, loading, success, failure }

extension ItemListLoadingStatusX on ItemListLoadingStatus {
  bool get isInitial => this == ItemListLoadingStatus.initial;

  bool get isLoading => this == ItemListLoadingStatus.loading;

  bool get isSuccess => this == ItemListLoadingStatus.success;

  bool get isFailure => this == ItemListLoadingStatus.failure;
}

class ItemCardState extends Equatable{
  ItemCardState({
    this.status = ItemListLoadingStatus.initial,
    this.items,
});
  final ItemListLoadingStatus status;
  final Items? items;

  ItemCardState copyWith({
    ItemListLoadingStatus? status,
    Items? items,
  }) {
    return ItemCardState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }
  @override

  List<Object?> get props => [status,items];

}