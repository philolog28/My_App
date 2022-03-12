import 'package:commerce_app/feature/presentation/cubit/item_card_cubit/item_card_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/item_color_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCardPage extends StatelessWidget {
  const ItemCardPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final int? productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ItemCardCubit(context.read(), productId),
      child: const _ItemCardPageWidget(),
    );
  }
}

class _ItemCardPageWidget extends StatefulWidget {
  const _ItemCardPageWidget({Key? key}) : super(key: key);

  @override
  _ItemCardPageWidgetState createState() => _ItemCardPageWidgetState();
}

class _ItemCardPageWidgetState extends State<_ItemCardPageWidget> {
  @override
  void initState() {
    context.read<ItemCardCubit>().fetchItemCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: BlocBuilder<ItemCardCubit, ItemCardState>(
          builder: (context, state) {
            if (state.status.isSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                     Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(

                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.black87, width: 2.5),
                                      bottom: BorderSide(
                                          color: Colors.black87, width: 2.5),
                                      left: BorderSide(
                                          color: Colors.black87, width: 2.5),
                                      right: BorderSide(
                                          color: Colors.black87, width: 2.5))),
                              child: Image.network(
                                  '${state.items!.image?.file?.url}',height: 500,)),
                        ),
                      ),
                    ),

                  Text(
                    '${state.items!.title}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '${state.items!.price} ₽',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                    width: state.items!.colors.length * 30,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ColorCircle(
                            code: state.items!.colors[index].code,
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: state.items!.colors.length,
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
