import 'package:bloc/bloc.dart';
import 'package:commerce_app/constants.dart';
import 'package:commerce_app/feature/domain/entities/basket_entities/get_basket_entity.dart';
import 'package:commerce_app/feature/domain/repositories/basket_repository/basket_repository.dart';
import 'package:equatable/equatable.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit(this.basketRepository) : super(LoadingState()) {
    init();
  }

  final BasketRepository basketRepository;
  Set<int?> basketItems = {};

  Future<void> init() async {
    basketItems = Set.from(respBasketProducts);
  }



  Future<void> basket() async {
    emit(LoadingState());
   try {
      final result = await basketRepository.getBasket();
      emit(LoadedState(items: result));
    }catch(e){
     print(e);
   }
  }

  Future<BasketEntity?> fetchBasket() async {
    emit(LoadingState());
    try {
      final item = await basketRepository.getBasket();
      emit(LoadedState(items: item));
      respBasketProducts.addAll(state.items!.items!.map((e) => e.product?.id));
      if(state.items!.items!.isEmpty){
        emit(BasketEmpty());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }

  Future<void> postOrDeleteFromBasket(
      {required int? productId, required bool value}) async {
    emit(PuttingLoadingState());
    try {
      if (!value) {
        basketRepository.postToBasket(productId: productId);
        basketItems.add(productId);
        respBasketProducts.add(productId);
      } else {
        basketRepository.deleteFromBasket(productId: productId);
        basketItems.remove(productId);
        respBasketProducts.remove(productId);
      }
    } catch (e) {
      emit(ErrorState());
    }
    emit(StopPuttingLoadingState());
    emit(BasketProductsState(productId: productId));
  }

    Future<void> changeItemQuantity(
      {required int? productId, required int? quantity}) async {
    emit(CounterLoadingState());
    await basketRepository.changeQuantity(productId: productId, quantity: quantity);
     await basket();
    emit(StopCounterLoadingState());
  }
  Future<void> deleteFromBasket({required int? productId}) async{
    emit(CounterLoadingState());
    await basketRepository.deleteFromBasket(productId: productId);
    await basket();
    emit(StopCounterLoadingState());
}
}
