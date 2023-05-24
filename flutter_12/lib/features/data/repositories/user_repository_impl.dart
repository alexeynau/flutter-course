import 'package:flutter_12/features/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {

  @override
  Future<UserModel> getDefaultUser() async {
    await Future<void>.delayed(
        const Duration(seconds: 1),
    );

    return const UserModel(id: 1, name: 'Default');
  }

  @override
  Future<UserModel> getUserById(int id) async {
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );

    return UserModel(id: id, name: 'Specific User number $id');
  }

}