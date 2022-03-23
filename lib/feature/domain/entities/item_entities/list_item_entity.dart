import 'package:commerce_app/feature/data/models/item_models/items_list_model.dart';
import 'package:commerce_app/feature/domain/entities/item_entities/entities.dart';
import 'package:commerce_app/feature/domain/entities/pagination.dart';
import 'package:equatable/equatable.dart';

class ListItemEnt extends Equatable {
  final List<Items> items;
  final Pagination? pagination;

  const ListItemEnt({required this.items, required this.pagination});

  @override
  List<Object?> get props => [items, pagination];
}
