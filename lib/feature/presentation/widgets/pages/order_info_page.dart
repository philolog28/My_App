import 'package:commerce_app/feature/domain/repositories/order_repository/order_repository.dart';
import 'package:commerce_app/feature/presentation/cubit/order_cubit/order_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/item_for_order.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/error_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderInfoPage extends StatelessWidget {
  const OrderInfoPage({
    Key? key,
    required this.name,
    required this.comment,
    required this.phone,
    required this.address,
    required this.email,
  }) : super(key: key);
  final String? name;
  final String? comment;
  final String? phone;
  final String? address;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderCubit(context.read<OrderRepository>()),
      child: _OrderInfoPageView(
        name: name,
        comment: comment,
        email: email,
        phone: '+7$phone',
        address: address,
      ),
    );
  }
}

class _OrderInfoPageView extends StatefulWidget {
  const _OrderInfoPageView({
    Key? key,
    required this.name,
    required this.comment,
    required this.phone,
    required this.address,
    required this.email,
  }) : super(key: key);
  final String? name;
  final String? comment;
  final String? phone;
  final String? address;
  final String? email;

  @override
  State<_OrderInfoPageView> createState() => _OrderInfoPageViewState();
}

class _OrderInfoPageViewState extends State<_OrderInfoPageView> {
  @override
  void initState() {
    context.read<OrderCubit>().createOrder(
        name: widget.name,
        address: widget.address,
        phone: widget.phone,
        email: widget.email,
        comment: widget.comment);
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
      }
      if (state is ErrorState) {
        return ErrorPage(refresh: ()=>context.read<OrderCubit>().createOrder(
            name: widget.name,
            address: widget.address,
            phone: widget.phone,
            email: widget.email,
            comment: widget.comment),);
      }
      return Container(
        color: Colors.white,
        child: const Center(child: CircularProgressIndicator()),
      );
    });
  }
}
