import 'package:commerce_app/feature/presentation/cubit/basket_cubit/basket_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';


class AddToBasketButton extends StatefulWidget {
  const AddToBasketButton({Key? key, required this.productId})
      : super(key: key);
  final int? productId;

  @override
  State<AddToBasketButton> createState() => _AddToBasketButtonState();
}

class _AddToBasketButtonState extends State<AddToBasketButton>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool _basket =
        context.read<BasketCubit>().basketItems.contains(widget.productId);
    return BlocListener<BasketCubit, BasketState>(
      listenWhen: (_, c) => c is BasketProductsState || c is BasketClearState,
      listener: (context, state) {
        if (state is BasketProductsState) {
          if (state.productId == widget.productId) {
            setState(() {});
          }
        } else {
          setState(() {});
        }
      },
      child: BlocBuilder<BasketCubit, BasketState>(
        buildWhen: (_, c) =>
            c is PuttingLoadingState || c is StopPuttingLoadingState,
        builder: (context, state) {
          return CupertinoButton(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            padding: EdgeInsets.zero,
            color: context
                    .read<BasketCubit>()
                    .basketItems
                    .contains(widget.productId)
                ? Colors.red
                : Colors.amber,
            child: Text(
              context.read<BasketCubit>().basketItems.contains(widget.productId)
                  ? 'Remove from Basket'
                  : 'Add to Basket',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              context.read<BasketCubit>().postOrDeleteFromBasket(
                  productId: widget.productId,
                  value: context
                      .read<BasketCubit>()
                      .basketItems
                      .contains(widget.productId));
            },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
