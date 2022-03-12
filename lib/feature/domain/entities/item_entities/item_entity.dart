import 'package:commerce_app/feature/domain/entities/item_entities/file_entity.dart';
import 'package:equatable/equatable.dart';
import 'color_entity.dart';
import 'image_entity.dart';

class Items extends Equatable {
  final int id;
  final String title;
  final String slug;
  final ImageEnt? image;
  final double price;
  final List<ColorsEnt> colors;

   const Items(
      {required this.id,
      required this.title,
      required this.slug,
      required this.image,
      required this.price,
      required this.colors});

  @override
  List<Object?> get props => [id, title,slug,image,price,colors];
  Items copyWith({
    int? id,
    String? title,
    String? slug,
    double? price,
    ImageEnt? image,
    List<ColorsEnt>? colors,
  }) {
    return Items(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      image: image ?? this.image,
      colors: colors ?? this.colors,
    );
  }
}



