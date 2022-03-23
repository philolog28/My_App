import 'package:commerce_app/feature/domain/repositories/sort_items_repository/sort_items_repository.dart';
import 'package:commerce_app/feature/presentation/cubit/sorted_page_cubit/sorted_page_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/product_card.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/catalog_page.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/error_page.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/tracking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'basket_page.dart';
import 'item_card_page.dart';
import 'order_page.dart';

class SortedItemsGrid extends StatelessWidget {
  const SortedItemsGrid({
    Key? key,
    this.productId,
  }) : super(key: key);
  final int? productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SortedItemCubit(context.read<SortItemRepository>(), productId),
      child: const _SortedItemsGridView(),
    );
  }
}

class _SortedItemsGridView extends StatefulWidget {
  const _SortedItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  State<_SortedItemsGridView> createState() => _SortedItemsGridViewState();
}

class _SortedItemsGridViewState extends State<_SortedItemsGridView> {
  @override
  void initState() {
    context.read<SortedItemCubit>().fetchSortedItemsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortedItemCubit, SortedItemsState>(
        builder: (context, state) {
      if (state.status.isSuccess) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Sorted catalog',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.amber,
            leading: IconButton(
                alignment: Alignment.centerLeft,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ItemsGrid())),
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                )),
          ),
          body: GridView.builder(
              padding: const EdgeInsets.only(bottom: 5),
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 2,
                mainAxisSpacing: 12,
              ),
              itemCount: state.items?.items.length,
              itemBuilder: (context, index) {
                return ItemCardForGridView(
                  id: state.items?.items[index].id,
                  title: state.items?.items[index].title,
                  url: state.items?.items[index].image?.file?.url,
                  price: state.items?.items[index].price,
                  colors: state.items!.items[index].colors,
                  routetoItemCard: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemCardPage(
                                productId: state.items?.items[index].id,
                              ))),
                );
              }),
          bottomNavigationBar: BottomAppBar(
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BasketPage())),
                    icon: const Icon(Icons.shopping_basket)),
                IconButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderPage())),
                    icon: Icon(Icons.account_balance_wallet)),
                IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrackingPage())),
                    icon: Icon(Icons.local_shipping)),
              ],
            ),
          ),
        );
      }
      if (state.status.isFailure) {
        return ErrorPage(
          refresh: () => context.read<SortedItemCubit>().fetchSortedItemsList(),
        );
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
