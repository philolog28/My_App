
import 'package:commerce_app/feature/data/models/item_models/image_model.dart';
import 'package:commerce_app/feature/data/models/item_models/item_model.dart';
import 'package:commerce_app/feature/data/models/item_models/file_model.dart';
import 'package:commerce_app/feature/data/mapper/mapper.dart';
import 'package:commerce_app/feature/data/models/item_models/items_list_model.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/file_mapper.dart';

class ImageResponseMapper extends Mapper<ImageModel,ImageEnt>{
  ImageResponseMapper({required this.fileResponseMapper});

  final FileResponseMapper fileResponseMapper;


  @override
  ImageEnt? map(ImageModel? entity){
    return ImageEnt(
        file: fileResponseMapper.map(entity?.file));

  }
}