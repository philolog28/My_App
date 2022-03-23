import 'package:equatable/equatable.dart';

class UserInformationEnt extends Equatable{
  const UserInformationEnt({
    required this.id,
    required this.accessKey,
});

  final int? id;
  final String? accessKey;

  @override
  List<Object?> get props => [id,accessKey];

  UserInformationEnt copyWith({
    int? id,
    String? accessKey,

  }) {
    return UserInformationEnt(
      id: id ?? this.id,
      accessKey: accessKey ?? this.accessKey,
    );
  }
}