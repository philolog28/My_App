import 'package:commerce_app/feature/presentation/cubit/user_login_cubit/user_login_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/user_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'catalog_page.dart';

class RouteToItemCardGrid extends StatelessWidget {
  const RouteToItemCardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserLoginCubit(context.read()),
      child: const _LoginPage(),
    );
  }
}

class _LoginPage extends StatefulWidget {
  const _LoginPage({Key? key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLoginCubit, UserLoginState>(
  builder: (context, state) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('LoginPage',style: TextStyle(color: Colors.black),),),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            UserLoginWidget(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.amber),
          onPressed:()
          {
            context.read<UserLoginCubit>().fetchUserLogin();
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemsGrid()));},
          child: Text('Login',style: TextStyle(color: Colors.black),)

        ),
          ],

        ),
      ),
    );
  },
);
  }
}

