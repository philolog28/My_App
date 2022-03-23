
import 'package:commerce_app/feature/data/models/item_models/pagination_model.dart';

import '../../../domain/entities/pagination.dart';
import '../mapper.dart';

class PaginationResponseMapper extends Mapper<PaginationModel, Pagination> {
  @override
  Pagination? map(PaginationModel? entity) {
    return Pagination(
        page: entity?.page ?? 1,
        pages: entity?.pages ?? 1,
        total: entity?.total ?? 1);
  }
}
