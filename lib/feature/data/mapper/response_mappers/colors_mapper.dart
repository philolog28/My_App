
import 'package:commerce_app/feature/data/mapper/mapper.dart';
import 'package:commerce_app/feature/data/models/item_models/colors_model.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';

class ColorsResponseMapper extends Mapper<ColorsModel, ColorsEnt> {


  @override
  ColorsEnt? map(ColorsModel? entityes) {
    return ColorsEnt(id: entityes?.id, title: entityes?.title, code: entityes?.code);
  }
}
