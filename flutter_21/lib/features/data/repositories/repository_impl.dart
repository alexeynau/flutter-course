import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_21/features/data/datasources/local_datasource.dart';
import 'package:flutter_21/features/data/datasources/remote_datasource.dart';
import 'package:flutter_21/features/data/models/category_model.dart';
import 'package:flutter_21/features/data/models/user.dart';
import 'package:flutter_21/features/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  LocalDatasource localDatasource = LocalDataSourceImpl();
  RemoteDatasource remoteDatasource = RemoteDatasourceImpl();
  UserDatabase userDatabase = UserDatabase();
  List<Category> listOfCategories = [];
  List<String> listOfPhotos = [];
  List<Uint8List> listOfRawPhotos = [];

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

  /// load photos
  @override
  Future<List<Uint8List>> loadPhotos() async {
    listOfRawPhotos = await localDatasource.loadPhotos();
    return localDatasource.loadPhotos();
  }

  /// load users from database
  @override
  Future<List<User>> loadUsers() {
    return userDatabase.allUserEntries;
  }

  @override
  addUser(User user) {
    userDatabase.insertUser(user);
  }
}
