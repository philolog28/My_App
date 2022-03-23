part of 'sort_category_cubit.dart';


enum SortListLoadingStatus { initial, loading, success, failure }

extension SortListLoadingStatusX on SortListLoadingStatus {
  bool get isInitial => this == SortListLoadingStatus.initial;

  bool get isLoading => this == SortListLoadingStatus.loading;

  bool get isSuccess => this == SortListLoadingStatus.success;

  bool get isFailure => this == SortListLoadingStatus.failure;
}

class SortListState extends Equatable{
  SortListState({
    this.status = SortListLoadingStatus.initial,
    this.items,
  });
  final SortListLoadingStatus status;
  final SortItemListEnt? items;

  SortListState copyWith({
    SortListLoadingStatus? status,
    SortItemListEnt? items,
  }) {
    return SortListState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }
  @override

  List<Object?> get props => [status,items];

}