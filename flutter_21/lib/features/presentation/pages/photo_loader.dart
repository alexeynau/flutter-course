import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_21/features/domain/repositories/repository.dart';

class PhotoLoader extends StatefulWidget {
  final Repository repository;
  const PhotoLoader({super.key, required this.repository});

  @override
  State<PhotoLoader> createState() => _PhotoLoaderState();
}

class _PhotoLoaderState extends State<PhotoLoader> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Loader'),
      ),
      body: FutureBuilder(
        future: widget.repository.loadPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
              itemBuilder: (context, index) {
                return Image.memory(snapshot.data![index]);
              },
              itemCount: snapshot.data!.length,
            );
          }
          return Text('Нет данных');
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
                    Text('Добавить фото по url'),
                    TextField(
                      controller: _textController,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        widget.repository.addPhoto(_textController.text);
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
