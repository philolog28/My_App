import 'package:commerce_app/feature/presentation/cubit/basket_cubit/basket_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({
    Key? key,
    required this.productId,
  }) : super(key: key);
    final int? productId;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(6),
    decoration: const BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.all(Radius.circular(8))),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () { 
          context.read<BasketCubit>().deleteFromBasket(productId: productId);
        }, 
        child: const Icon(Icons.clear,color: Colors.white,),),
    );
  }
}
