import 'package:commerce_app/feature/data/models/item_models/items_list_model.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/item_entity.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/list_item_entity.dart';
import 'package:commerce_app/feature/domain/repositories/item_repository/item_repository.dart';

class GetAllItems {
  final ItemRepository itemRepository;

  GetAllItems(this.itemRepository);

  Future<ListItemEnt?> call(
  ) async {
    return await itemRepository.getAllItems();
  }
}
