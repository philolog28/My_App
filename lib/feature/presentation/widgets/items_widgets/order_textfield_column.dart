import 'package:commerce_app/feature/presentation/widgets/pages/order_info_page.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderTextFields extends StatefulWidget {
  const OrderTextFields({
    Key? key,
    this.name = '',
    this.mask,
  }) : super(key: key);
  final TextInputMask? mask;
  final String? name;

  @override
  _OrderTextFieldsState createState() => _OrderTextFieldsState();
}

class _OrderTextFieldsState extends State<OrderTextFields> {
  final TextEditingController _nameController = TextEditingController();

  String get name => _nameController.text;

  final TextEditingController _addressController = TextEditingController();

  String get address => _addressController.text;

  final TextEditingController _phoneController = TextEditingController();

  String get phone => _phoneController.text;

  final TextEditingController _emailController = TextEditingController();

  String get email => _emailController.text;

  final TextEditingController _commentController = TextEditingController();

  String get comment => _commentController.text;

  @override
  Widget build(BuildContext context) {
    var nameField = TextField(
      cursorColor: Colors.amber,
      controller: _nameController,
      decoration: const InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelText: 'Name',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );

    var addressField = TextField(
      cursorColor: Colors.amber,
      controller: _addressController,
      decoration: const InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelText: 'Address',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );

    var phoneField = TextField(
      keyboardType: TextInputType.phone,
      cursorColor: Colors.amber,
      controller: _phoneController,
      inputFormatters: widget.mask == null ? [] : [widget.mask!],
      decoration:  InputDecoration(
        prefixIcon: Padding(
          padding: const  EdgeInsets.only(left: 12, right: 6),
          child: SizedBox(
            width: 40,
            child:Row(
              children: [
                 const Padding(
                  padding:  EdgeInsets.only(bottom: 2),
                  child: Text(
                    '+7',
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  height: 28,
                  width: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 3,
                ),
              ],
            ),
          ),
        ),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelText: 'Phone',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );

    var emailField = TextField(
      cursorColor: Colors.amber,
      controller: _emailController,
      decoration: const InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelText: 'email',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );

    var commentField = TextField(
      cursorColor: Colors.amber,
      controller: _commentController,
      decoration: const InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelText: 'Comment',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );

    return Container(
      padding: EdgeInsets.all(8),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            nameField,
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            addressField,
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            phoneField,
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            emailField,
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            commentField,
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
                  'Create Order',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderInfoPage(
                                name: name,
                                comment: comment,
                                phone: phone,
                                address: address,
                                email: email,
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
