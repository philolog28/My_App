import 'package:commerce_app/constants.dart';
import 'package:commerce_app/feature/domain/repositories/basket_repository/basket_repository.dart';
import 'package:commerce_app/feature/presentation/cubit/basket_cubit/basket_cubit.dart';
import 'package:commerce_app/feature/presentation/cubit/user_login_cubit/user_login_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/user_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'catalog_page.dart';

class RouteToItemCardGrid extends StatelessWidget {
  const RouteToItemCardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserLoginCubit(context.read()),
        ),
        BlocProvider(
          create: (_) => BasketCubit(context.read<BasketRepository>()),
        ),
      ],
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
              title: const Text(
                'LoginPage',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UserLoginWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        onPressed: () {
                          context.read<BasketCubit>().fetchBasket();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemsGrid()));
                        },
                        child: const Text(
                          'Sing in',
                          style: TextStyle(color: Colors.black),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        onPressed: () {
                          context.read<UserLoginCubit>().fetchUserLogin();
                          respBasketProducts.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemsGrid()));
                        },
                        child: Text(
                          'Sing up',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
