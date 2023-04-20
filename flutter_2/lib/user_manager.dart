class User {
  final String _email;

  User(this._email);
}

mixin EmailDomainer on User {
  String get getMailSystem => _email.substring(_email.indexOf('@') + 1);
}

class AdminUser extends User with EmailDomainer {
  AdminUser(email) : super(email);

  @override
  String toString() {
    return getMailSystem;
  }
}

class GeneralUser extends User {
  GeneralUser(email) : super(email);

  @override
  String toString() {
    return _email;
  }
}

class UserManager<T extends User> {
  List<T> userList;
  UserManager(this.userList);

  void add(T user) => userList.add(user);
  void remove(T user) => userList.remove(user);

  String getUsersMails() {
    return userList.toString();
  }
}
