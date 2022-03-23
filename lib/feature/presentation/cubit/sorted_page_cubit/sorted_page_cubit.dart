import 'package:bloc/bloc.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/list_item_entity.dart';
import 'package:commerce_app/feature/domain/repositories/sort_items_repository/sort_items_repository.dart';
import 'package:equatable/equatable.dart';

part 'sorted_page_state.dart';

class SortedItemCubit extends Cubit<SortedItemsState> {
  SortedItemCubit(this._sortItemRepository,this.categoryId) : super(SortedItemsState());

  final SortItemRepository _sortItemRepository;
  final int? categoryId;

  Future <ListItemEnt?> fetchSortedItemsList() async{
    emit(state.copyWith(status: SortedItemListLoadingStatus.loading));
    try{
      final item =  await _sortItemRepository.getAllItemsFromCategory(categoryId: categoryId);
      emit(state.copyWith(status: SortedItemListLoadingStatus.success,items: item));
    }
    catch (e){
      emit(state.copyWith(status: SortedItemListLoadingStatus.failure));
    }
  }
}
