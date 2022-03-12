import 'dart:convert';

import 'package:commerce_app/feature/data/mapper/response_mappers/user_login_mapper.dart';
import 'package:commerce_app/feature/data/models/user_login_model.dart';
import 'package:commerce_app/feature/domain/entities/user_login_entity/user_login_entity.dart';
import 'package:commerce_app/feature/domain/repositories/user_repository/user_login_repository.dart';
import 'package:http/http.dart' as http;

class UserLoginRequestFailure implements Exception {}

class UserLoginNotFoundFailure implements Exception {}

class UserLoginRepositoryImpl implements UserLoginRepository {
  static const _baseUrl = 'vue-study.skillbox.cc';

  const UserLoginRepositoryImpl(this._userLoginMapper);

  final UserLoginMapper _userLoginMapper;

  @override
  Future <UserLoginEnt?> getUserAccessKey() async {
    final userAccessKeyRequest = Uri.https(_baseUrl, '/api/users/accessKey');
    final userAccessKeyResponse = await http.get(userAccessKeyRequest);
    var _response = UserLoginModel.fromJson(json.decode(userAccessKeyResponse.body));
    if (userAccessKeyResponse.statusCode != 200) {
      throw UserLoginRequestFailure();
    }

    final userAccessKey = _userLoginMapper.map(_response);
    return userAccessKey;
  }

}
