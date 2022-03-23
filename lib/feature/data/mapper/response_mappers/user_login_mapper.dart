
import 'package:commerce_app/feature/data/mapper/mapper.dart';
import 'package:commerce_app/feature/data/models/user_login_model.dart';
import 'package:commerce_app/feature/domain/entities/user_login_entity/user_login_entity.dart';

class UserLoginMapper extends Mapper<UserLoginModel, UserLoginEnt> {


  @override
  UserLoginEnt? map(UserLoginModel? entity) {
    return UserLoginEnt(
      accessKey: entity?.accessKey,
    );
  }
}
