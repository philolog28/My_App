import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sorted_page_state.dart';

class SortedPageCubit extends Cubit<SortedPageState> {
  SortedPageCubit() : super(SortedPageInitial());
}
