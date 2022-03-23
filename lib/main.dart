import 'package:commerce_app/feature/presentation/widgets/pages/user_login_page.dart';
import 'package:flutter/material.dart';

import 'development.dart';

Future<void> main() async => await Development().init();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RouteToItemCardGrid(),
    );
  }
}
