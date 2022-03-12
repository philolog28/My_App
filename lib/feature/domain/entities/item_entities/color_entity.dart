import 'package:equatable/equatable.dart';

class ColorsEnt extends Equatable {
  final int? id;
  final String? title;
  final String? code;
   const ColorsEnt({
    required this.id,
    required this.title,
    required this.code,
});
  @override

  List<Object?> get props => [id,title,code];
  ColorsEnt copyWith({
    int? id,
    String? title,
    String? code,

  }) {
    return ColorsEnt(
      id: id ?? this.id,
      title: title ?? this.title,
      code: code ?? this.code,
    );
  }
}

