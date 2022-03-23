import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key,required this.refresh}) : super(key: key);
  final VoidCallback? refresh;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Error',style: TextStyle(color: Colors.black),),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 300)),
          Center(child: const Text('🙈', style: TextStyle(fontSize: 64))),
          Center(
            child: Text(
              'Something went wrong!',
              style: theme.textTheme.headline5,
            ),
          ),
           CupertinoButton(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            padding: EdgeInsets.zero,
            color: Colors.amber,
             child: Text(
              'Refresh',
              style: TextStyle(color: Colors.black),
          ),
             onPressed: refresh,
           ),
        ],
      ),
    );
  }
}
