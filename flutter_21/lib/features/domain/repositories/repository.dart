import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_21/features/data/models/category_model.dart';

abstract class Repository {
  Future<List<Category>> loadCategories();
  Future<void> addCategory(Category category);
  List<Category> get categories;
  Future<void> addPhoto(String url);
  Future<List<Uint8List>> loadPhotos();
}
