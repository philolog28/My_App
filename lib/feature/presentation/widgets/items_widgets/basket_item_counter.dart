import 'package:commerce_app/feature/presentation/cubit/basket_cubit/basket_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




import 'package:flutter_bloc/flutter_bloc.dart';


class Counter extends StatefulWidget {
  const Counter({
    required this.quantity,
    required this.productId,
    Key? key,
  }) : super(key: key);

  final int? quantity;
  final int? productId;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 95,
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(children: [
        SizedBox(
          width: 16,
          height: 16,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (widget.quantity! > 1) {
                context.read<BasketCubit>().changeItemQuantity(
                    productId: widget.productId, quantity: widget.quantity! - 1);
              }
            },
            child: const  Icon(Icons.remove),
          ),
        ),
        const SizedBox(width: 6),
        Container(
          width: 1,
          height: 16,
          color: Colors.black,
        ),
        SizedBox(
          width: 36,
          child: Text(
            '${widget.quantity}',
            style:  const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 1,
          height: 16,
          color:Colors.black,
        ),
        const SizedBox(width: 6),
        SizedBox(
          width: 16,
          height: 16,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              context.read<BasketCubit>().changeItemQuantity(
                  productId: widget.productId, quantity: widget.quantity! + 1);
            },
            child: Center(child: const  Icon(Icons.add,color: Colors.black,)),
          ),
        ),
      ]),
    );
  }
}
