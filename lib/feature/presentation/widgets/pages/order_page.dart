

import 'package:commerce_app/feature/domain/repositories/order_repository/order_repository.dart';
import 'package:commerce_app/feature/presentation/cubit/order_cubit/order_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/order_textfield_column.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => OrderCubit(context.read<OrderRepository>()),
    child: _OrderPageView());
  }
}

class _OrderPageView extends StatefulWidget {
  const _OrderPageView({Key? key}) : super(key: key);

  @override
  _OrderPageViewState createState() => _OrderPageViewState();
}

class _OrderPageViewState extends State<_OrderPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Order',
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
        mainAxisSize: MainAxisSize.min,
        children: [
          OrderTextFields(
            mask: TextInputMask(mask: '9999999999'),
          ),
        ],
      ),
    );
  }
}


