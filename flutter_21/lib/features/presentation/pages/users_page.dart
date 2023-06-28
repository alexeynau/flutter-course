import 'package:flutter/material.dart';
import '../../data/models/user.dart';
import '../../data/models/user_card.dart';
import '../../domain/repositories/repository.dart';

class UsersPage extends StatefulWidget {
  final Repository repository;
  const UsersPage({super.key, required this.repository});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _cardNameController = TextEditingController();
  TextEditingController _cardDateController = TextEditingController();
  TextEditingController _cardCvvController = TextEditingController();
  // TODO: Исправить хардкод
  int id = 0;

  @override
  void initState() {
    super.initState();

    // TODO: Исправить хардкод
    // widget.repository.addUser(
    //   const User(
    //       id: 0,
    //       firstName: "firstName",
    //       lastName: "lastName",
    //       age: 15,
    //       phoneNumber: "+792011141141"),
    // );
    // widget.repository.addUser(
    //   const User(
    //       id: 1,
    //       firstName: "Name",
    //       lastName: "last",
    //       age: 16,
    //       phoneNumber: "+7920141"),
    // );
    // widget.repository.addUser(
    //   const User(
    //       id: 2,
    //       firstName: "first",
    //       lastName: "last",
    //       age: 18,
    //       phoneNumber: "+11141141"),
    // );
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
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              UserCard currentCard = widget.repository
                                  .loadCard(snapshot.data![index].id);
                              return Card(
                                color: Colors.green,
                                child: Column(
                                  children: [
                                    Text(currentCard.number),
                                    Text(currentCard.date),
                                    Text(currentCard.name),
                                    Text("${currentCard.cvv}"),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ID ${snapshot.data![index].id}"),
                              Text("Имя ${snapshot.data![index].firstName}"),
                              Text("Фамилия ${snapshot.data![index].lastName}"),
                              Text("Возраст ${snapshot.data![index].age}"),
                              Text(
                                "Телефон ${snapshot.data![index].phoneNumber}",
                              ),
                            ],
                          ),
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
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // add user
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: "qqqqqqqqq",
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
                                decoration:
                                    const InputDecoration(labelText: 'Имя'),
                              ),
                              TextField(
                                controller: _lastNameController,
                                decoration:
                                    const InputDecoration(labelText: 'Фамилия'),
                              ),
                              TextField(
                                keyboardType: TextInputType.numberWithOptions(),
                                controller: _ageController,
                                decoration:
                                    const InputDecoration(labelText: 'Возраст'),
                              ),
                              TextField(
                                keyboardType: TextInputType.phone,
                                controller: _phoneNumberController,
                                decoration:
                                    const InputDecoration(labelText: 'Телефон'),
                              ),
                              Card(
                                color: Colors.green,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: _cardNumberController,
                                      decoration: const InputDecoration(
                                          labelText: 'Номер карты'),
                                    ),
                                    TextField(
                                      controller: _cardNameController,
                                      decoration: const InputDecoration(
                                          labelText: 'Имя держателя'),
                                    ),
                                    TextField(
                                      controller: _cardDateController,
                                      decoration: const InputDecoration(
                                          labelText: 'Дата'),
                                    ),
                                    TextField(
                                      controller: _cardCvvController,
                                      decoration: const InputDecoration(
                                          labelText: 'Cvv'),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                  widget.repository.addUser(
                                    User(
                                      id: id,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      age: int.parse(_ageController.text),
                                      phoneNumber: _phoneNumberController.text,
                                    ),
                                  );
                                  widget.repository.addCard(
                                    UserCard(
                                      id: "${id}_user_card_id",
                                      number: _cardNumberController.text,
                                      name: _cardNameController.text,
                                      date: _cardDateController.text,
                                      cvv: int.parse(_cardCvvController.text),
                                    ),
                                  );
                                  id++;
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
              ),
              // delete all users
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: "del",
                  onPressed: () {
                    widget.repository.deleteAllUsers();
                    setState(() {});
                  },
                ),
              ),
              //delete current user by id
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: "sdsd",
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Card(
                          child: Column(
                            children: [
                              const Center(child: Text('Удалить элемент')),
                              TextField(
                                controller: _idController,
                                decoration:
                                    const InputDecoration(labelText: 'id'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                  widget.repository.deleteUser(
                                      int.parse(_idController.text));
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                    setState(() {});
                  },
                  child: const Icon(Icons.delete_outline_sharp),
                ),
              ),
            ],
          ),
        ));
  }
}
