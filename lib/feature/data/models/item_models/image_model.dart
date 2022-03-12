import 'package:json_annotation/json_annotation.dart';
import 'file_model.dart';
part 'image_model.g.dart';



@JsonSerializable()
class ImageModel{
  ImageModel({
    this.file
});
  final FileModel? file;
   factory ImageModel.fromJson(Object? json) =>
       _$ImageModelFromJson(json as Map<String,dynamic>);
   Map<String,dynamic> toJson() => _$ImageModelToJson(this);
}
