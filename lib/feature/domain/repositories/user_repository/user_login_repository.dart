
import 'package:commerce_app/feature/domain/entities/user_login_entity/user_login_entity.dart';

abstract class UserLoginRepository{
  Future <UserLoginEnt?> getUserAccessKey();
}