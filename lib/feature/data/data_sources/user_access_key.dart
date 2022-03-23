import 'package:commerce_app/feature/data/data_sources/base_store.dart';

mixin UserAccessKey on BaseStore {
  static const accessKey = 'accessKey';
  static const  orderId = 'id';

  String? getAccessKey() {
    return sharedPreferences.getString(accessKey);
  }

  Future<void> setAccessKey(String? value) {
    return sharedPreferences.setString(accessKey, '$value');
  }
  String? getOrderId() {

    return sharedPreferences.getString(orderId);
  }
  Future<void> setOrderId(String? value) {
    return sharedPreferences.setString(accessKey, '$value');
  }
}
