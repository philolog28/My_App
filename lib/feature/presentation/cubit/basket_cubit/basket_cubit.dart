import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(BasketInitial());
}
