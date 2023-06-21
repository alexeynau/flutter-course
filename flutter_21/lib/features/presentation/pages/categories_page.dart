import 'package:flutter/material.dart';
import 'package:flutter_21/features/data/models/category_model.dart';
import 'package:flutter_21/features/data/repositories/repository_impl.dart';
import 'package:flutter_21/features/domain/repositories/repository.dart';
import 'package:flutter_21/features/presentation/pages/current_category_page.dart';

import 'photo_loader.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  TextEditingController _textController = TextEditingController();
  final Repository repository = RepositoryImpl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: FutureBuilder(
        future: repository.loadCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data![index].categoryName,
                  ),
                  tileColor: Colors.lightGreen,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CurrentCategoryPage(
                            repository: repository,
                            category: snapshot.data![index]),
                      ),
                    );
                  },
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
          return Text('Нет данных');
        },
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text('PhotoLoader'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PhotoLoader(repository: repository),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Card(
                child: Column(
                  children: [
                    Text('Добавить категорию'),
                    TextField(
                      controller: _textController,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        repository.addCategory(
                          Category(
                              categoryName: _textController.text, content: []),
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
