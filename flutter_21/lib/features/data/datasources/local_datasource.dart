import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/category_model.dart';
import '../models/user.dart';
import '../models/user_card.dart';

abstract class LocalDatasource {
  Future<void> cacheCategories(List<Category> categories);

  Future<List<Category>> loadCategories();

  Future<void> cachePhotos(List<String> pathsToPhotos);
  Future<List<Uint8List>> loadPhotos();
  Future<List<User>> loadUsers();
  deleteAllUsers();
  addUser(User user);
  deleteUser(int id);
  cacheCard(List<UserCard> userCards);
  Future<List<UserCard>> loadCards();
}

class Dummies {
  static const String categories = 'categories';
  static const String photos = 'photos';
  static const String cards = 'cards';
}

class LocalDataSourceImpl implements LocalDatasource {
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // late SharedPreferences prefs;
  UserDatabase userDatabase = UserDatabase();

  final _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    wOptions: WindowsOptions(),
  );

  // LocalDataSourceImpl() {
  //   _initPref();
  // }

  // _initPref() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  @override
  Future<void> cacheCategories(List<Category> categories) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Dummies.categories, categoryToJson(categories));
  }

  @override
  Future<List<Category>> loadCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.get(Dummies.categories) as String;
    print(result);
    return categoryFromJson(result);
  }

  @override
  Future<void> cachePhotos(List<String> pathsToPhotos) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(Dummies.photos, pathsToPhotos);
  }

  @override
  Future<List<Uint8List>> loadPhotos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> result = prefs.getStringList(Dummies.photos) ?? [];
    print("photos $result");
    return result.map((path) => File(path).readAsBytesSync()).toList();
  }

  @override
  addUser(User user) {
    userDatabase.insertUser(user);
  }

  @override
  deleteUser(int id) async {
    await userDatabase.deleteUser(id);
  }

  @override
  Future<List<User>> loadUsers() {
    return userDatabase.allUserEntries;
  }

  @override
  cacheCard(List<UserCard> userCards) async {
    await _secureStorage.write(
        key: Dummies.cards, value: userCardToJson(userCards));
  }

  @override
  Future<List<UserCard>> loadCards() async {
    final all = await _secureStorage.read(key: Dummies.cards);
    return userCardFromJson(all!);
  }

  @override
  deleteAllUsers() {
    userDatabase.deleteAll();
    _secureStorage.write(key: Dummies.cards, value: userCardToJson([]));
  }
}
