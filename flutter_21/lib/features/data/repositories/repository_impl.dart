import 'dart:typed_data';

import '../../domain/repositories/repository.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';
import '../models/category_model.dart';
import '../models/user.dart';
import '../models/user_card.dart';

class RepositoryImpl implements Repository {
  LocalDatasource localDatasource = LocalDataSourceImpl();
  RemoteDatasource remoteDatasource = RemoteDatasourceImpl();
  List<Category> listOfCategories = [];
  List<String> listOfPhotos = [];
  List<Uint8List> listOfRawPhotos = [];
  List<UserCard> listOfUserCards = [];

  /// add new category to list and cache
  @override
  Future<void> addCategory(Category category) async {
    listOfCategories.add(category);
    await localDatasource.cacheCategories(listOfCategories);
  }

  /// load categories
  @override
  Future<List<Category>> loadCategories() async {
    // print(localDatasource.loadCategories());
    listOfCategories = await localDatasource.loadCategories();
    return localDatasource.loadCategories();
  }

  @override
  List<Category> get categories => listOfCategories;

  /// add new photo to list and cache
  @override
  Future<void> addPhoto(String url) async {
    String pathToPhoto = await remoteDatasource.downloadImage(url);
    listOfPhotos.add(pathToPhoto);
    localDatasource.cachePhotos(listOfPhotos);
  }

  /// load photos
  @override
  Future<List<Uint8List>> loadPhotos() async {
    listOfRawPhotos = await localDatasource.loadPhotos();
    return localDatasource.loadPhotos();
  }

  /// load users from database
  @override
  Future<List<User>> loadUsers() async {
    (await localDatasource.loadUsers()).forEach((element) {
      print(element.id);
    });
    return localDatasource.loadUsers();
  }

  /// add user to data base
  @override
  addUser(User user) {
    localDatasource.addUser(user);
  }

  /// delete user from data base
  @override
  deleteUser(int id) {
    print("delete $id");
    localDatasource.deleteUser(id);
  }

  @override
  addCard(UserCard userCard) {
    listOfUserCards.add(userCard);
    localDatasource.cacheCard(listOfUserCards);
  }

  @override
  Future<List<UserCard>> loadAllCards() async {
    return localDatasource.loadCards();
  }

  @override
  UserCard loadCard(int id) {
    return listOfUserCards
        .firstWhere((userCard) => userCard.id == "${id}_user_card_id");
  }

  @override
  deleteAllUsers() {
    localDatasource.deleteAllUsers();
    listOfUserCards.clear();
  }

  @override
  List<Uint8List> get photos => listOfRawPhotos;
}
