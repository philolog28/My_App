import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';
import 'package:commerce_app/feature/domain/repositories/item_repository/item_repository.dart';

class SearchItem {
  final ItemRepository itemRepository;

  SearchItem(this.itemRepository);
  Future<List<Items>?> searchItem(String itemId) async{
    return await itemRepository.searchItem(itemId);
  }
}