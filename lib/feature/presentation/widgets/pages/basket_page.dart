import 'package:commerce_app/feature/domain/repositories/basket_repository/basket_repository.dart';
import 'package:commerce_app/feature/presentation/cubit/basket_cubit/basket_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/item_for_basket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'error_page.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BasketCubit(context.read<BasketRepository>()),
      child: const _BasketPageView(),
    );
  }
}

class _BasketPageView extends StatefulWidget {
  const _BasketPageView({
    Key? key,
  }) : super(key: key);

  @override
  State<_BasketPageView> createState() => _BasketPageViewState();
}

class _BasketPageViewState extends State<_BasketPageView> {
  @override
  void initState() {
    context.read<BasketCubit>().fetchBasket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketState>(
        listenWhen: (_, c) =>
            c is CounterLoadingState || c is StopCounterLoadingState,
        listener: (context, state) {},
        buildWhen: (_, c) =>
            c is LoadedState ||
            c is LoadingState ||
            c is ErrorState ||
            c is BasketEmpty,
        builder: (context, state) {
          if (state is LoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Basket',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.amber,
                leading: IconButton(
                    alignment: Alignment.centerLeft,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    )),
              ),
              body: Container(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return BasketProduct(
                        price: state.items?.items![index].price,
                        title: state.items?.items![index].product?.title,
                        url: state
                            .items?.items![index].product?.image?.file?.url,
                        quantity: state.items?.items![index].quantity,
                        productId: state.items?.items![index].product?.id,
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 0,
                          color: Colors.black,
                        ),
                    itemCount: state.items?.items?.length ?? 5),
              ),
            );
          }
          if (state is BasketEmpty) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Basket',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.amber,
                leading: IconButton(
                    alignment: Alignment.centerLeft,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    )),
              ),
              body: Container(
                color: Colors.white,
                child: Center(child: Text('Basket is empty!',style: TextStyle(fontSize: 35),),),
              ),
            );
          }
          if (state is ErrorState) {
            return ErrorPage(refresh: ()=>  context.read<BasketCubit>().fetchBasket() ,);
          }
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
