import 'package:commerce_app/feature/domain/entities/item_entities/item_entity.dart';
import 'package:commerce_app/feature/domain/repositories/item_repository/item_repository.dart';
import 'package:commerce_app/feature/presentation/cubit/item_cubit/item_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/product_card.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/order_page.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/sort_page.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/tracking_page.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/user_login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'basket_page.dart';
import 'item_card_page.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ItemCubit(context.read<ItemRepository>()),
      child: const _ItemsGridView(),
    );
  }
}

class _ItemsGridView extends StatefulWidget {
  const _ItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  State<_ItemsGridView> createState() => _ItemsGridViewState();
}

class _ItemsGridViewState extends State<_ItemsGridView> {
  final PagingController<int, Items> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((offset) {
      context.read<ItemCubit>().fetchItemsList(offset: offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ItemCubit, ItemsState>(
        listener: (context, state) async {
      if (state.status.isSuccess) {
        if (state.items?.pagination?.page == state.items?.pagination?.pages) {
          _pagingController.appendLastPage(state.items!.items);
        } else {
          _pagingController.appendPage(
              state.items!.items, state.items!.pagination!.page + 1);
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Catalog',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.amber,
          leading: IconButton(
              alignment: Alignment.centerLeft,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RouteToItemCardGrid())),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              )),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategoryList())),
                icon: const Icon(
                  Icons.filter_list_rounded,
                  color: Colors.black,
                ))
          ],
        ),
        body: CupertinoScrollbar(
          child: CustomScrollView(
            slivers: [
              state.status.isSuccess
                  ? SliverList(
                      delegate: SliverChildListDelegate([
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      )
                    ]))
                  : SliverToBoxAdapter(
                      child: Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(top: 10),
                      child: CircularProgressIndicator(),
                    )),
              productBuilder(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
            ],
          ),
        ),
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
                  icon: const Icon(Icons.account_balance_wallet)),
              IconButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TrackingPage())),
                  icon: const Icon(Icons.local_shipping)),
            ],
          ),
        ),
      );
    });
  }

  PagedSliverList<int, Items> productBuilder() {
    return PagedSliverList.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Items>(
          noItemsFoundIndicatorBuilder: (_) => Container(),
          firstPageProgressIndicatorBuilder: (_) => Container(),
          newPageProgressIndicatorBuilder: (_) => Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(),
              ),
          itemBuilder: (context, items, index) => SizedBox(
                height: 410,
                child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemCardPage(
                                  productId: items.id,
                                ))),
                    child: ItemCardForGridView(
                      title: items.title,
                      id: items.id,
                      price: items.price,
                      url: items.image?.file?.url,
                      colors: items.colors,
                      routetoItemCard: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemCardPage(
                                    productId: items.id,
                                  ))),
                    )),
              )),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }
}
