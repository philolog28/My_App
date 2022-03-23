import 'package:equatable/equatable.dart';


class SortItemsEnt extends Equatable {
  final int? id;
  final String? title;
  final String? slug;


  const SortItemsEnt(
      {required this.id,
        required this.title,
        required this.slug,
        });

  @override
  List<Object?> get props => [id, title,slug];
  SortItemsEnt copyWith({
    int? id,
    String? title,
    String? slug,
  }) {
    return SortItemsEnt(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
    );
  }
}



