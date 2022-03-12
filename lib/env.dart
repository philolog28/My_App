import 'package:flutter/material.dart';

import 'injection.dart';
import 'main.dart';

class Env {


  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final injectionContainer = await injection(const App());
    runApp(injectionContainer);
  }
}