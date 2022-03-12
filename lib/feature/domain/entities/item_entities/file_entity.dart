import 'package:equatable/equatable.dart';

class File extends Equatable{
  final String? url;
  final String? name;
  final String? originalName;
  final String? extension;
  final String? size;

  File({
    required this.url,
    required this.name,
    required this.originalName,
    required this.extension,
    required this.size,
  });


  @override
  List<Object?> get props => [url,name,originalName,extension,size];
}