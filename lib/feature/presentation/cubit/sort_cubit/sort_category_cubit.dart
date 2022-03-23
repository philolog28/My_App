import 'package:commerce_app/feature/domain/entities/item_entities/item_entity.dart';
import 'package:commerce_app/feature/domain/entities/sort_entities/sort_item_list_entity.dart';
import 'package:commerce_app/feature/domain/repositories/sort_items_repository/sort_items_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sort_category_state.dart';

class SortCategoryCubit extends Cubit<SortListState> {
  SortCategoryCubit(this._sortItemRepository) : super(SortListState());



  final SortItemRepository _sortItemRepository;

  Future <SortItemListEnt?> fetchListCategories() async {
    emit(state.copyWith(status: SortListLoadingStatus.loading));
    try {
      final item = await _sortItemRepository.getAllCategories();
      emit(state.copyWith(status: SortListLoadingStatus.success, items: item));
    }
    catch (e) {
      emit(state.copyWith(status: SortListLoadingStatus.failure));
    }
  }
}
