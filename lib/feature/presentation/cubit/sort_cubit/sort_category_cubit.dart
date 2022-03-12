import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sort_category_state.dart';

class SortCategoryCubit extends Cubit<SortCategoryState> {
  SortCategoryCubit() : super(SortCategoryInitial());
}
