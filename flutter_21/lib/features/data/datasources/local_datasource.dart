import 'package:shared_preferences/shared_preferences.dart';

import '../models/category_model.dart';

abstract class LocalDatasource {
  Future<void> cacheCategories(List<Category> categories);

  Future<List<Category>> loadCategories();
}

class LocalDataSourceImpl implements LocalDatasource {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> cacheCategories(List<Category> categories) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setString('categories', categoryToJson(categories));
  }

  @override
  Future<List<Category>> loadCategories() async {
    final SharedPreferences prefs = await _prefs;
    var result = prefs.get('categories') as String;
    return categoryFromJson(result);
  }
}
