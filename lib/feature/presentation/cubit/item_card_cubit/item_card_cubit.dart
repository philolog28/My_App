import 'package:commerce_app/feature/domain/entities/item_entities/item_entity.dart';
import 'package:commerce_app/feature/domain/repositories/item_card_repository/item_card_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

part 'item_card_state.dart';

class ItemCardCubit extends Cubit<ItemCardState> {
  ItemCardCubit(this._itemCardRepository, this.productId) : super(ItemCardState());



  final ItemCardRepository _itemCardRepository;
  final int? productId;

  Future <Items?> fetchItemCard() async {
    emit(state.copyWith(status: ItemListLoadingStatus.loading));
    print(1);
    try {
      final item = await _itemCardRepository.getItemCard(productId: productId);
      emit(state.copyWith(status: ItemListLoadingStatus.success, items: item));
    } on Exception {
      emit(state.copyWith(status: ItemListLoadingStatus.failure));
    }
    catch (e) {
      print(e);
    }
  }
}
