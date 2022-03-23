import 'package:commerce_app/feature/domain/repositories/sort_items_repository/sort_items_repository.dart';
import 'package:commerce_app/feature/presentation/cubit/sort_cubit/sort_category_cubit.dart';
import 'package:commerce_app/feature/presentation/widgets/items_widgets/sort_category_widget.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/error_page.dart';
import 'package:commerce_app/feature/presentation/widgets/pages/sorted_catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SortCategoryCubit(context.read<SortItemRepository>()),
      child: const _SortCategoriesView(),
    );
  }
}

class _SortCategoriesView extends StatefulWidget {
  const _SortCategoriesView({
    Key? key,
  }) : super(key: key);

  @override
  State<_SortCategoriesView> createState() => _SortCategoriesViewState();
}

class _SortCategoriesViewState extends State<_SortCategoriesView> {
  @override
  void initState() {
    context.read<SortCategoryCubit>().fetchListCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortCategoryCubit, SortListState>(
        builder: (context, state) {
          if (state.status.isSuccess) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    ' Filter',
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.amber,
                  leading: IconButton(
                    alignment: Alignment.centerLeft,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                body: Center(
                  child: Container(
                    child: ListView.separated(
                        itemCount: 7,
                        separatorBuilder: (context, index) =>
                            Divider(height: 0, color: Colors.black,),
                        itemBuilder: (context, index) {
                          return CategoryForSortFilter(
                              categoryId: state.items?.items[index].id,
                              title: state.items?.items[index].title,
                              slug: state.items?.items[index].title,
                              routeToSortedCatalog: () =>
                                  Navigator.push(
                                      context, MaterialPageRoute(
                                      builder: (context) => SortedItemsGrid(productId:state.items?.items[index].id))),

                          );
                        }),
                  ),
                ));
          } if (state.status.isFailure){
            return ErrorPage(refresh: ()=>context.read<SortCategoryCubit>().fetchListCategories() ,);
          }
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
