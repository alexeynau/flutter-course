import 'dart:typed_data';

import '../../data/models/category_model.dart';
import '../../data/models/user.dart';
import '../../data/models/user_card.dart';

abstract class Repository {
  Future<List<Category>> loadCategories();
  Future<void> addCategory(Category category);
  List<Category> get categories;
  List<Uint8List> get photos;
  Future<void> addPhoto(String url);
  Future<List<Uint8List>> loadPhotos();
  Future<List<User>> loadUsers();
  addUser(User user);
  deleteUser(int id);
  Future<List<UserCard>> loadAllCards();
  addCard(UserCard userCard);
  UserCard loadCard(int id);
  deleteAllUsers();
}
