import 'package:equatable/equatable.dart';

class ProductCategories extends Equatable {
  final int id;
  final String title;
  final String slug;

   const ProductCategories({
    required this.id,
    required this.title,
    required this.slug,
  });

  @override
  List<Object?> get props => [id, title, slug];
}
