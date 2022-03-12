part of 'user_login_cubit.dart';


enum UserLoginLoadingStatus { initial, loading, success, failure }

extension UserLoginLoadingStatusX on UserLoginLoadingStatus {
  bool get isInitial => this == UserLoginLoadingStatus.initial;

  bool get isLoading => this == UserLoginLoadingStatus.loading;


  bool get isSuccess => this == UserLoginLoadingStatus.success;

  bool get isFailure => this == UserLoginLoadingStatus.failure;
}

class UserLoginState extends Equatable{
  UserLoginState({
    this.status = UserLoginLoadingStatus.initial,
    this.accessKey,
  });
  final UserLoginLoadingStatus status;
  final UserLoginEnt? accessKey;

  UserLoginState copyWith({
    UserLoginLoadingStatus? status,
    UserLoginEnt? accessKey,
  }) {
    return UserLoginState(
      status: status ?? this.status,
      accessKey: accessKey ?? this.accessKey,
    );
  }

  @override

  List<Object?> get props => [status,accessKey];

}