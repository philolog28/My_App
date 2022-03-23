import 'package:commerce_app/feature/domain/entities/item_entities/list_item_entity.dart';
import 'package:commerce_app/feature/domain/entities/sort_entities/sort_item_list_entity.dart';


abstract class SortItemRepository {
  Future <SortItemListEnt?>? getAllCategories(){
  }

  Future<ListItemEnt?>? getAllItemsFromCategory({required int? categoryId}){
  }
}
