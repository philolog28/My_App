import 'package:commerce_app/feature/domain/repositories/order_repository/order_repository.dart';
import 'package:commerce_app/feature/presentation/cubit/order_cubit/order_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/order_tracking_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => OrderCubit(context.read<OrderRepository>()),
        child: _TrackingPageView());
  }
}

class _TrackingPageView extends StatefulWidget {
  const _TrackingPageView({Key? key}) : super(key: key);

  @override
  _TrackingPageViewState createState() => _TrackingPageViewState();
}

class _TrackingPageViewState extends State<_TrackingPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Check Order',
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
        children: const [
          OrderTrackingTextField(),
        ],
      ),
    );
  }
}
