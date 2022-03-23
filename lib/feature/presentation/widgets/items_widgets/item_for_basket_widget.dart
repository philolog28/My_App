import 'package:commerce_app/feature/presentation/widgets/items_widgets/basket_item_counter.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/remove_item_button.dart';
import 'package:flutter/material.dart';

class BasketProduct extends StatelessWidget {
  const BasketProduct(
      {Key? key,
        required this.productId,
        required this.price,
        required this.title,
        required this.url,
        required this.quantity})
      : super(key: key);
  final int? productId;
  final double? price;
  final String? title;
  final String? url;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    const widthImage = 64.0;
    const heightImage = 84.0;

    var imageBlock = Container(
      height: heightImage,
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.center,
        child: Image.network('$url', height: heightImage, width: widthImage),
      ),
    );
    var titleBlock = Text(
      '$title ',
      style: const TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
    );
    var textPrice = Text(
      '$price ₽',
      style: const TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
    );
    var textQuantity = Text(
      '$quantity',
      style: const TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
    );

    return Container(
      height: 155,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              imageBlock,
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleBlock,
                      textPrice,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Counter(quantity: quantity, productId: productId),
                          RemoveButton(productId:productId),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
