
import 'package:commerce_app/feature/data/mapper/mapper.dart';
import 'package:commerce_app/feature/data/models/item_models/colors_model.dart';
import 'package:commerce_app/feature/data/models/sort_item_model.dart';
import 'package:commerce_app/feature/domain/entities/sort_entities/sort_item_entity.dart';

class SortItemMapper extends Mapper<SortItemsModel, SortItemsEnt> {


  @override
  SortItemsEnt? map(SortItemsModel? entityes) {
    return SortItemsEnt(id: entityes?.id, title: entityes?.title, slug: entityes?.slug);
  }
}
