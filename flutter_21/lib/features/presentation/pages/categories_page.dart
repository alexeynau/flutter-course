import 'package:flutter/material.dart';
import 'package:flutter_21/features/presentation/bloc/bloc/list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/category_model.dart';
import '../../data/repositories/repository_impl.dart';
import '../../domain/repositories/repository.dart';
import 'current_category_page.dart';
import 'users_page.dart';

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
    BlocProvider.of<ListBloc>(context).add(ListInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          List<Category> categories =
              BlocProvider.of<ListBloc>(context).repository.categories;
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  categories[index].categoryName,
                ),
                tileColor: Colors.lightGreen,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CurrentCategoryPage(
                          repository: repository, category: categories[index]),
                    ),
                  );
                },
              );
            },
            itemCount: categories.length,
          );
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
              ListTile(
                title: Text('Users Page'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UsersPage(repository: repository),
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
                        BlocProvider.of<ListBloc>(context).add(
                          AddToCategoryListEvent(
                            Category(
                              categoryName: _textController.text,
                              content: [],
                            ),
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
