import 'package:flutter_21/features/data/datasources/local_datasource.dart';
import 'package:flutter_21/features/data/models/category_model.dart';
import 'package:flutter_21/features/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  LocalDatasource localDatasource = LocalDataSourceImpl();
  List<Category> listOfCategories = [];
  @override
  Future<void> addCategory(Category category) async {
    listOfCategories.add(category);
    await localDatasource.cacheCategories(listOfCategories);
  }

  @override
  Future<List<Category>> loadCategories() async {
    return await localDatasource.loadCategories();
  }

  @override
  List<Category> get categories => listOfCategories;
}
