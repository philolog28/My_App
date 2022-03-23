
import 'package:commerce_app/feature/data/models/basket_user_model.dart';
import 'package:commerce_app/feature/data/mapper/mapper.dart';
import 'package:commerce_app/feature/domain/entities/basket_entities/get_user_for_get_basket.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/file_mapper.dart';

class BasketUserMapper extends Mapper<BasketUserModel,UserInformationEnt>{


  @override
  UserInformationEnt? map(BasketUserModel? entity){
    return UserInformationEnt(
      id: entity?.id,
      accessKey: entity?.accessKey,
        );

  }
}