import '../../data/models/user_model.dart';

abstract class UserRepository{
  Future<UserModel> getDefaultUser();
  Future<UserModel> getUserById(int id);
}