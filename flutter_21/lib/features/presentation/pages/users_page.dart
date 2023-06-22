import 'package:flutter/material.dart';
import 'package:flutter_21/features/data/models/user.dart';
import 'package:flutter_21/features/domain/repositories/repository.dart';

class UsersPage extends StatefulWidget {
  final Repository repository;
  const UsersPage({super.key, required this.repository});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  // TODO: Исправить хардкод
  int id = 3;

  @override
  void initState() {
    super.initState();

    // TODO: Исправить хардкод
    widget.repository.addUser(
      const User(
          id: 0,
          firstName: "firstName",
          lastName: "lastName",
          age: 15,
          phoneNumber: "+792011141141"),
    );
    widget.repository.addUser(
      const User(
          id: 1,
          firstName: "Name",
          lastName: "last",
          age: 16,
          phoneNumber: "+7920141"),
    );
    widget.repository.addUser(
      const User(
          id: 2,
          firstName: "first",
          lastName: "last",
          age: 18,
          phoneNumber: "+11141141"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder(
        future: widget.repository.loadUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Text("Имя ${snapshot.data![index].firstName}"),
                          Text("Фамилия ${snapshot.data![index].lastName}"),
                          Text("Возраст ${snapshot.data![index].age}"),
                          Text("Телефон ${snapshot.data![index].phoneNumber}"),
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              } else {
                return const Text('Нет данных');
              }
            default:
              return const Text('Нет данных');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Card(
                child: Column(
                  children: [
                    const Center(child: Text('Добавить элемент')),
                    TextField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(labelText: 'Имя'),
                    ),
                    TextField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(labelText: 'Фамилия'),
                    ),
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _ageController,
                      decoration: const InputDecoration(labelText: 'Возраст'),
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(labelText: 'Телефон'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        widget.repository.addUser(
                          User(
                            id: id++,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            age: int.parse(_ageController.text),
                            phoneNumber: _phoneNumberController.text,
                          ),
                        );

                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.check,
                        color: Colors.greenAccent,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
