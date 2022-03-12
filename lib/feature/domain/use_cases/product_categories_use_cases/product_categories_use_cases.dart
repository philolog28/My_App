import 'package:commerce_app/feature/domain/entities/product_categories_entities/product_categories_entities.dart';
import 'package:commerce_app/feature/domain/repositories/product_categories_repository/product_categories_repository.dart';

class GetAllCategories {
  final ProductCategoriesRepository productCategoriesRepository;

  GetAllCategories(this.productCategoriesRepository);

  Future<List<ProductCategories>?> getCategories() async{
    return await productCategoriesRepository.getCategories();
  }
}