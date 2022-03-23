import 'package:commerce_app/feature/domain/entities/item_entities/color_entity.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/item_color_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryForSortFilter extends StatelessWidget {
  const CategoryForSortFilter(
      {Key? key,
        required this.categoryId,
        required this.title,
        required this.slug,
        required this.routeToSortedCatalog})
      : super(key: key);
  final int? categoryId;
  final String? title;
  final String? slug;
  final VoidCallback routeToSortedCatalog;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => routeToSortedCatalog(),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            color: Colors.amber,
          ),
         child: Text('${title}',style: const TextStyle(color: Colors.black),),
        ),
    );
  }
}
