import 'package:commerce_app/feature/data/mapper/response_mappers/colors_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/file_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/imageResponseMapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/items_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/list_item_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/user_login_mapper.dart';
import 'package:commerce_app/feature/data/repository/user_login_repository/user_login_repository.dart';
import 'package:commerce_app/feature/domain/repositories/item_card_repository/item_card_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/data/repository/item_repository/item_card_repository.dart';
import 'feature/data/repository/item_repository/item_repository.dart';
import 'feature/domain/repositories/item_repository/item_repository.dart';
import 'feature/domain/repositories/user_repository/user_login_repository.dart';

Future<Widget> injection(Widget app) async {
  // Initializations.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final fileResponseMapper = FileResponseMapper();
  final imageResponseMapper = ImageResponseMapper(fileResponseMapper: fileResponseMapper);
  final colorsResponseMapper = ColorsResponseMapper();
  final categoryResponseMapper = ItemResponseMapper(colorsResponseMapper: colorsResponseMapper, imageResponseMapper: imageResponseMapper);
  final listItemMapper = ListItemMapper( categoryResponseMapper: categoryResponseMapper);
  final itemRepositoryImpl = ItemRepositoryImpl(listItemMapper);
  final itemCardRepository = ItemCardRepositoryImpl(categoryResponseMapper);
  final userLoginMapper  = UserLoginMapper();
  final userLoginRepository = UserLoginRepositoryImpl(userLoginMapper);
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<ItemRepository>(create: (_) => itemRepositoryImpl),
      RepositoryProvider<ItemCardRepository>(create: (_)=> itemCardRepository),
      RepositoryProvider<UserLoginRepository>(create: (_) =>userLoginRepository ),
    ],
    child: app,
  );
}