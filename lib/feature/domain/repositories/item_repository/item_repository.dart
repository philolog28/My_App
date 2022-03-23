import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/list_item_entity.dart';


abstract class ItemRepository {
  Future <ListItemEnt?>? getAllItems({required int offset}){
  }

  Future<List<Items>>? searchItem(String itemId){

  }
}
