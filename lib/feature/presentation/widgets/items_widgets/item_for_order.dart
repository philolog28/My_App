import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {Key? key,
        required this.price,
        required this.title,
        required this.url,
        required this.quantity})
      : super(key: key);
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
      width: widthImage,
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
      '$price',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textQuantity,
                          textPrice,
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
