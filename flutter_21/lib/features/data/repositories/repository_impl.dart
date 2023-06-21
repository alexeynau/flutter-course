import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_21/features/data/datasources/local_datasource.dart';
import 'package:flutter_21/features/data/datasources/remote_datasource.dart';
import 'package:flutter_21/features/data/models/category_model.dart';
import 'package:flutter_21/features/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  LocalDatasource localDatasource = LocalDataSourceImpl();
  RemoteDatasource remoteDatasource = RemoteDatasourceImpl();
  List<Category> listOfCategories = [];
  List<String> listOfPhotos = [];

  /// add new category to list and cache
  @override
  Future<void> addCategory(Category category) async {
    listOfCategories.add(category);
    await localDatasource.cacheCategories(listOfCategories);
  }

  /// load categories
  @override
  Future<List<Category>> loadCategories() async {
    return await localDatasource.loadCategories();
  }

  @override
  List<Category> get categories => listOfCategories;

  /// add new photo to list and cache
  @override
  Future<void> addPhoto(String url) async {
    String pathToPhoto = await remoteDatasource.downloadImage(url);
    listOfPhotos.add(pathToPhoto);
    await localDatasource.cachePhotos(listOfPhotos);
  }

  @override
  Future<List<Uint8List>> loadPhotos() async {
    return await localDatasource.loadPhotos();
  }
}
