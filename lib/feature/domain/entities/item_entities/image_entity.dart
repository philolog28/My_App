import 'package:equatable/equatable.dart';

import 'file_entity.dart';

class ImageEnt extends Equatable {
  final File? file;

  const ImageEnt({required this.file});

  @override
  List<Object?> get props => [file];
}

