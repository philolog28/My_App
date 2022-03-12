import 'package:commerce_app/env.dart';

Future<void> main() async => Development().init();

class Development extends Env {
  final String baseUrl = 'https://novex-tl29457159-app.dev.creonit.ru/';
  final bool showAlice = true;
  final bool writeLogs = true;
  final String siteUrl = '';
}