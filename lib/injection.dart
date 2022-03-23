import 'package:commerce_app/feature/data/data_sources/store.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/basket_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/colors_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/file_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/imageResponseMapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/items_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/list_item_mapper.dart';
import 'package:commerce_app/feature/data/mapper/response_mappers/user_login_mapper.dart';
import 'package:commerce_app/feature/data/repository/basket_repository/basket_repository.dart';
import 'package:commerce_app/feature/data/repository/order_repository/order_repository.dart';
import 'package:commerce_app/feature/data/repository/user_login_repository/user_login_repository.dart';
import 'package:commerce_app/feature/domain/repositories/basket_repository/basket_repository.dart';
import 'package:commerce_app/feature/domain/repositories/item_card_repository/item_card_repository.dart';
import 'package:commerce_app/feature/domain/repositories/order_repository/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/data/mapper/response_mappers/basket_item_mapper.dart';
import 'feature/data/mapper/response_mappers/basket_user_mapper.dart';
import 'feature/data/mapper/response_mappers/order_mapper.dart';
import 'feature/data/mapper/response_mappers/pagination_mapper.dart';
import 'feature/data/mapper/response_mappers/sort_item_list_mapper.dart';
import 'feature/data/mapper/response_mappers/sort_item_mapper.dart';
import 'feature/data/repository/item_repository/item_card_repository.dart';
import 'feature/data/repository/item_repository/item_repository.dart';
import 'feature/data/repository/sort_repository/sort_repository.dart';
import 'feature/domain/repositories/item_repository/item_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/domain/repositories/sort_items_repository/sort_items_repository.dart';
import 'feature/domain/repositories/user_repository/user_login_repository.dart';

Future<Widget> injection(Widget app) async {
  final store = Store( await SharedPreferences.getInstance());


  // Initializations.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final fileResponseMapper = FileResponseMapper();
  final imageResponseMapper = ImageResponseMapper(fileResponseMapper: fileResponseMapper);
  final colorsResponseMapper = ColorsResponseMapper();
  final paginationResponseMapper = PaginationResponseMapper();
  final categoryResponseMapper = ItemResponseMapper(colorsResponseMapper: colorsResponseMapper, imageResponseMapper: imageResponseMapper);
  final listItemMapper = ListItemMapper( categoryResponseMapper: categoryResponseMapper,paginationResponseMapper:paginationResponseMapper);
  final itemRepositoryImpl = ItemRepositoryImpl(listItemMapper);
  final itemCardRepository = ItemCardRepositoryImpl(categoryResponseMapper);
  final userLoginMapper  = UserLoginMapper();
  final userLoginRepository = UserLoginRepositoryImpl(userLoginMapper,store);
  final sortItemMapper = SortItemMapper();
  final sortListItemMapper = SortListItemMapper(sortItemMapper:sortItemMapper);
  final sortItemRepository = SortItemRepositoryImpl(sortListItemMapper,listItemMapper);
  final basketUserMapper = BasketUserMapper();
  final basketItemMapper = BasketItemMapper(itemResponseMapper:categoryResponseMapper );
  final basketMapper = BasketMapper(basketUserMapper: basketUserMapper,basketItemMapper:basketItemMapper );
  final basketRepository = BasketRepositoryImpl(basketMapper, store);
  final orderMapper = OrderMapper(colorsResponseMapper:colorsResponseMapper,basketMapper:basketMapper);
  final orderRepository = OrderRepositoryImpl(orderMapper, store);


  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<ItemRepository>(create: (_) => itemRepositoryImpl),
      RepositoryProvider<ItemCardRepository>(create: (_)=> itemCardRepository),
      RepositoryProvider<UserLoginRepository>(create: (_) =>userLoginRepository ),
      RepositoryProvider<SortItemRepository>(create: (_)=>sortItemRepository),
      RepositoryProvider<BasketRepository>(create: (_)=>basketRepository),
      RepositoryProvider<OrderRepository>(create: (_) =>orderRepository),
    ],
    child: app,
  );
}