import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
part "user.g.dart";

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  IntColumn get age => integer()();
  TextColumn get phoneNumber => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users])
class UserDatabase extends _$UserDatabase {
  UserDatabase() : super(_openConnection());

  Future<List<User>> get allUserEntries => select(users).get();
  Future<int> insertUser(User user) => into(users).insert(user);

  @override
  int get schemaVersion => 1;
}
