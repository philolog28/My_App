import 'package:commerce_app/feature/domain/repositories/order_repository/order_repository.dart';
import 'package:commerce_app/feature/presentation/cubit/order_cubit/order_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/item_for_order.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({
    Key? key,
    required this.orderId,
  }) : super(key: key);
  final String? orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderCubit(context.read<OrderRepository>()),
      child: _OrderTrackingPageView(
        orderId: orderId,
      ),
    );
  }
}

class _OrderTrackingPageView extends StatefulWidget {
  const _OrderTrackingPageView({
    Key? key,
    required this.orderId,
  }) : super(key: key);
  final String? orderId;

  @override
  State<_OrderTrackingPageView> createState() => _OrderTrackingPageViewState();
}

class _OrderTrackingPageViewState extends State<_OrderTrackingPageView> {
  @override
  void initState() {
    context.read<OrderCubit>().getOrderInfo(orderId: widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
      if (state is OrderLoadedState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Order Information',
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
          body: Column(
            children: [
              Container(
                height: 150,
                width: 400,
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${state.order?.totalPrice} ₽',
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    Text(
                      'Order Id: ${state.order?.id}',
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    Text(
                      '${state.order?.status?.title}',
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    Text(
                      '${state.order?.address}',
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ],
                ),
              ),
              Container(
                height: 567,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return OrderItem(
                        price:
                            state.order?.basket?.items![index].product?.price,
                        quantity: state.order?.basket?.items![index].quantity,
                        title:
                            state.order?.basket?.items![index].product?.title,
                        url: state.order?.basket?.items![index].product?.image
                            ?.file?.url,
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 0,
                          color: Colors.black,
                        ),
                    itemCount: state.order!.basket!.items!.length),
              ),
            ],
          ),
        );
      } if (state is ErrorState){
        return ErrorPage(refresh:()=> context.read<OrderCubit>().getOrderInfo(orderId: widget.orderId) ,);
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
