import 'package:commerce_app/feature/presentation/cubit/order_cubit/order_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/order_info_page.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/order_tracking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class OrderTrackingTextField extends StatefulWidget {
  const OrderTrackingTextField({
    Key? key,
  }) : super(key: key);


  @override
  _OrderTrackingTextFieldState createState() => _OrderTrackingTextFieldState();
}

class _OrderTrackingTextFieldState extends State<OrderTrackingTextField> {
  final TextEditingController _orderIdController = TextEditingController();

  String get orderId => _orderIdController.text;



  @override
  Widget build(BuildContext context) {
    var orderField = TextField(
      cursorColor: Colors.amber,
      controller: _orderIdController,
      decoration: const InputDecoration(
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelText: 'OrderId',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );

    return Container(
      padding: const  EdgeInsets.all(8),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            orderField,
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            SizedBox(
              height: 40,
              width: 100,
              child: CupertinoButton(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                padding: EdgeInsets.zero,
                color: Colors.amber,
                child: const Text(
                  'Check Order',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderTrackingPage(
                            orderId: orderId,
                          )));

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
