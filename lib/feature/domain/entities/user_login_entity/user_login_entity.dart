import 'package:equatable/equatable.dart';

class UserLoginEnt extends Equatable {
  const UserLoginEnt({
    required this.accessKey,
  });

  final String? accessKey;

  @override
  List<Object?> get props => [accessKey];

  UserLoginEnt copyWith({
    String? accessKey,
  }) {
    return UserLoginEnt(
      accessKey: accessKey ?? this.accessKey,
    );
  }
}
