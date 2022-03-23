part of 'sorted_page_cubit.dart';

enum SortedItemListLoadingStatus { initial, loading, success, failure }

extension SortedItemListLoadingStatusX on SortedItemListLoadingStatus {
  bool get isInitial => this == SortedItemListLoadingStatus.initial;

  bool get isLoading => this == SortedItemListLoadingStatus.loading;

  bool get isSuccess => this == SortedItemListLoadingStatus.success;

  bool get isFailure => this == SortedItemListLoadingStatus.failure;
}

class SortedItemsState extends Equatable {
  SortedItemsState({
    this.status = SortedItemListLoadingStatus.initial,
    this.items,
  });

  final SortedItemListLoadingStatus status;
  final ListItemEnt? items;

  SortedItemsState copyWith({
    SortedItemListLoadingStatus? status,
    ListItemEnt? items,
  }) {
    return SortedItemsState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, items];
}
