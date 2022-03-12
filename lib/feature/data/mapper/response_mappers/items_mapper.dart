

import 'package:commerce_app/feature/data/mapper/response_mappers/colors_mapper.dart';
import 'package:commerce_app/feature/data/models/item_models/colors_model.dart';
import 'package:commerce_app/feature/data/models/item_models/item_model.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';


import '../mapper.dart';

import 'imageResponseMapper.dart';

class ItemResponseMapper extends Mapper<ItemsModel,Items> {
  ItemResponseMapper({ required this.colorsResponseMapper,
  required this.imageResponseMapper,
  });

  final ImageResponseMapper imageResponseMapper;
  final ColorsResponseMapper colorsResponseMapper;

  @override
  Items? map(ItemsModel? entity) {
    List<ColorsModel>? colors = entity?.colors;
    return Items(
        id: entity?.id ?? 0,
        title: entity?.title ?? '',
        slug: entity?.slug ?? '',
        price: entity?.price ??  0,
        image: imageResponseMapper.map(entity?.image),
        colors: colorsResponseMapper.mapList(colors)
    );


  }
}
