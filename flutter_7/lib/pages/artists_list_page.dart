import 'package:flutter/material.dart';

import '../from_json/albums_from_json.dart';

// page that shows list of ListTiles with groups' names

class ArtistListPage extends StatefulWidget {
  static const routeName = '/albums';
  const ArtistListPage({super.key});

  @override
  State<ArtistListPage> createState() => _ArtistListPageState();
}

class _ArtistListPageState extends State<ArtistListPage> {
  late Future<List> futureAlbum;
  @override
  void initState() {
    futureAlbum = fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Groups'),
      ),
      body: FutureBuilder<List>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!
                  .map((e) => ListTile(
                        title: Text(e.artist),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/artist',
                            arguments: {
                              'album': e,
                            }
                            );
                        },
                      ))
                  .toList(),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                child: const Text(
                  'Home',
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
              ),
              TextButton(
                child: const Text(
                  'Albums',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/albums');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
