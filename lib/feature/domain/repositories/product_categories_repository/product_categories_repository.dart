import 'package:commerce_app/feature/domain/entities/product_categories_entities/product_categories_entities.dart';

abstract class ProductCategoriesRepository {

  Future<List<ProductCategories>>? getCategories() {

  }

}