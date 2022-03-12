import 'package:bloc/bloc.dart';
import 'package:commerce_app/feature/domain/entities/user_login_entity/user_login_entity.dart';
import 'package:commerce_app/feature/domain/repositories/user_repository/user_login_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit(this._userLoginRepository) : super(UserLoginState());



  final UserLoginRepository _userLoginRepository;

  Future <UserLoginEnt?> fetchUserLogin() async {
    emit(state.copyWith(status: UserLoginLoadingStatus.loading));
    print(1);
    try {
      final accessKey = await _userLoginRepository.getUserAccessKey();
      emit(state.copyWith(status: UserLoginLoadingStatus.success, accessKey: accessKey));
    } on Exception {
      emit(state.copyWith(status: UserLoginLoadingStatus.failure));
    }
    catch (e) {
      print(e);
    }
  }
}
