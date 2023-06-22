import 'dart:io';
import 'dart:typed_data';

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
  late List<Uint8List> rawPhotos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPhotos();
  }

  initPhotos() async {
    rawPhotos = await widget.repository.loadPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Loader'),
      ),
      body: FutureBuilder(
        future: widget.repository.loadPhotos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
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
            default:
              return Text('Нет данных');
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
                    Text('Добавить фото по url'),
                    TextField(
                      controller: _textController,
                    ),
                    // download and save image using url given in text field
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
