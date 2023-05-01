import 'package:flutter/material.dart';

import '../from_json/albums_from_json.dart';

// this page represents <Album> object as a page with title and body

class ArtistPage extends StatefulWidget {
  static const routeName = '/artist';
  final Album album;
  const ArtistPage({super.key, required this.album});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.album.artist),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(child: Text(widget.album.about)),
        ));
  }
}
