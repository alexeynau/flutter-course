import 'package:flutter/material.dart';
import 'package:flutter_21/features/data/models/category_model.dart';
import 'package:flutter_21/features/domain/repositories/repository.dart';
import 'package:flutter_21/features/presentation/pages/element_page.dart';
import 'package:flutter_21/features/presentation/pages/photo_loader.dart';

class CurrentCategoryPage extends StatefulWidget {
  final Repository repository;
  final Category category;
  const CurrentCategoryPage(
      {super.key, required this.repository, required this.category});

  @override
  State<CurrentCategoryPage> createState() => _CurrentCategoryPageState();
}

class _CurrentCategoryPageState extends State<CurrentCategoryPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category: ${widget.category.categoryName}'),
      ),
      body: Builder(builder: (context) {
        if (widget.category.content.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  widget.category.content[index].name,
                ),
                tileColor: const Color.fromARGB(255, 61, 90, 219),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ElementPage(
                        content: widget.category.content[index],
                      ),
                    ),
                  );
                },
              );
            },
            itemCount: widget.category.content.length,
          );
        }
        return const Text('Пусто');
      }),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text('PhotoLoader'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          PhotoLoader(repository: widget.repository),
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
                    const Center(child: Text('Добавить элемент')),
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Название'),
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(labelText: 'Описание'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        widget.category.content.add(
                          Content(
                            name: _titleController.text,
                            description: _descriptionController.text,
                          ),
                        );
                        widget.repository.addCategory(widget.category);
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