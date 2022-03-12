

import 'package:commerce_app/feature/domain/repositories/item_repository/item_repository.dart';
import 'package:commerce_app/feature/presentation/cubit/item_cubit/item_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item_card_page.dart';


class ItemsGrid extends StatelessWidget {
  const ItemsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
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
  @override
  void initState() {
    context.read<ItemCubit>().fetchItemsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemsState>(builder: (context, state) {
      if (state.status.isSuccess) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Catalog',style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.amber,
            leading:
            IconButton(
                alignment: Alignment.centerLeft,
                onPressed:()=> Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,))
            ,
          ),
          body: GridView.builder(
              padding: const EdgeInsets.only(bottom: 1),
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 1,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return ItemCardForGridView(
                  id: state.items?.items[index].id,
                  title: state.items?.items[index].title,
                  url: state.items?.items[index].image?.file?.url,
                  price: state.items?.items[index].price,
                  colors: state.items!.items[index].colors,
                  routetoItemCard:()=> Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> ItemCardPage(productId: state.items?.items[index].id,))),
                );
              }),
          bottomNavigationBar: BottomAppBar(
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: ()=>null, icon: Icon(Icons.shopping_basket)),
                IconButton(onPressed: ()=>null, icon: Icon(Icons.account_balance_wallet)),
                IconButton(onPressed: ()=>null, icon: Icon(Icons.local_shipping)),
              ],
            ),
          ),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}