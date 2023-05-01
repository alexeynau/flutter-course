import 'package:flutter/material.dart';

class ArtistListPage extends StatefulWidget {
  static const routeName = '/albums';
  const ArtistListPage({super.key});

  @override
  State<ArtistListPage> createState() => _ArtistListPageState();
}

class _ArtistListPageState extends State<ArtistListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ArtistsListPage'),
    );
  }
}