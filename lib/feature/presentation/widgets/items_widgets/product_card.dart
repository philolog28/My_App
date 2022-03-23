import 'package:commerce_app/feature/domain/entities/item_entities/color_entity.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/item_color_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCardForGridView extends StatelessWidget {
  const ItemCardForGridView(
      {Key? key,
      required this.id,
      required this.title,
      required this.url,
      required this.price,
      required this.colors,
      required this.routetoItemCard})
      : super(key: key);
  final int? id;
  final String? title;
  final String? url;
  final double? price;
  final List<ColorsEnt> colors;
  final VoidCallback routetoItemCard;

  @override
  Widget build(BuildContext context) {
    itemPrice() {
      return Text(
        '$price ₽',
        style: const TextStyle(fontSize: 25),
      );
    }

    itemTitle() {
      return Text(
        '$title',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25),
      );
    }

    colorContainer() {
      return Center(
        child: SizedBox(
          height: 20,
          width: colors.length * 40,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ColorCircle(
                  code: colors[index].code,
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => routetoItemCard(),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.network('${url}'),
              ),
            ),


              itemTitle(),

            itemPrice(),



               Align(
                  alignment: Alignment.topCenter, child: colorContainer()),


          ],
        ),
      ),
    );
  }
}
