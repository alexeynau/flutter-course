import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/repository.dart';
import '../bloc/bloc/list_bloc.dart';

class PhotoLoader extends StatefulWidget {
  final Repository repository;
  const PhotoLoader({super.key, required this.repository});

  @override
  State<PhotoLoader> createState() => _PhotoLoaderState();
}

class _PhotoLoaderState extends State<PhotoLoader> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ListBloc>(context).add(ListInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Loader'),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          List<Uint8List> photos =
              BlocProvider.of<ListBloc>(context).repository.photos;
          print("in builder ${photos.length}");
          return ListView.builder(
            itemBuilder: (context, index) {
              return Image.memory(photos[index]);
            },
            itemCount: photos.length,
          );
        },
      ),

      //  FutureBuilder(
      //   future: widget.repository.loadPhotos(),
      //   builder: (context, snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.done:
      //         if (snapshot.hasData) {
      //           return ListView.builder(
      //             itemBuilder: (context, index) {
      //               return Image.memory(snapshot.data![index]);
      //             },
      //             itemCount: snapshot.data!.length,
      //           );
      //         }
      //         return Text('Нет данных');
      //       default:
      //         return Text('Нет данных');
      //     }
      //   },
      // ),
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
                        BlocProvider.of<ListBloc>(context)
                            .add(AddToPhotoListEvent(_textController.text));
                        Navigator.of(context).pop(_textController.text);
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
          // .then(
          //   (value) {
          //     if (value is String) {
          //       setState(() {
          //         widget.repository.addPhoto(_textController.text);
          //       });
          //     }
          //   },
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
