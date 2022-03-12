import 'package:commerce_app/feature/data/mapper/mapper.dart';
import 'package:commerce_app/feature/data/models/item_models/file_model.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';

class FileResponseMapper extends Mapper<FileModel, File> {

  @override
  File? map(FileModel? entityes) {
    return File(
      url: entityes?.url ?? '',
      name: entityes?.name ?? '',
      originalName: entityes?.originalName ?? '',
      extension: entityes?.extension ?? '' ,
      size : entityes?.size ?? '',
    );
  }
}
