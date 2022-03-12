
import 'package:commerce_app/feature/domain/repositories/item_repository/item_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/list_item_entity.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemsState> {
  ItemCubit(this._itemRepository) : super(ItemsState());

  final ItemRepository _itemRepository;

  Future <ListItemEnt?> fetchItemsList() async{
    emit(state.copyWith(status: ItemListLoadingStatus.loading));

    try{
      final item =  await _itemRepository.getAllItems();
      emit(state.copyWith(status: ItemListLoadingStatus.success,items: item));

    }on Exception{
      emit(state.copyWith(status: ItemListLoadingStatus.failure));
    }
    catch (e){
      print(e);
    }
  }
}
