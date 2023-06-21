import 'dart:io';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/category_model.dart';

abstract class LocalDatasource {
  Future<void> cacheCategories(List<Category> categories);

  Future<List<Category>> loadCategories();

  Future<void> cachePhotos(List<String> pathsToPhotos);
  Future<List<Uint8List>> loadPhotos();
}

class Dummies {
  static const String categories = 'categories';
  static const String photos = 'photos';
}

class LocalDataSourceImpl implements LocalDatasource {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  LocalDataSourceImpl() {
    initPref();
  }

  initPref() async {
    prefs = await _prefs;
  }

  @override
  Future<void> cacheCategories(List<Category> categories) async {
    prefs.setString(Dummies.categories, categoryToJson(categories));
  }

  @override
  Future<List<Category>> loadCategories() async {
    var result = prefs.get(Dummies.categories) as String;
    return categoryFromJson(result);
  }

  @override
  Future<void> cachePhotos(List<String> pathsToPhotos) async {
    prefs.setStringList(Dummies.photos, pathsToPhotos);
  }

  @override
  Future<List<Uint8List>> loadPhotos() async {
    var result = prefs.get(Dummies.photos) as List<String>;
    return result.map((path) => File(path).readAsBytesSync()).toList();
  }
}
