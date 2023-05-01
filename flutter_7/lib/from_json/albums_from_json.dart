import 'package:http/http.dart' as http;
import 'dart:convert';

// class that represent object from json file

class Album {
  final String artist;
  final String about;

  Album({
    required this.artist,
    required this.about,
  });

  // factory method that convert map into <Album> object
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      artist: json['artist'],
      about: json['about'],
    );
  }
}


// function that get response and return list of <Album> objects by parsing json file
Future<List> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/leocoderu/Flutter-SkillboxStudy/main/07_Navigation/albums_route/assets/files/artists.json'));
  List albumsList = [];
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List parsedList = jsonDecode(response.body);
    for (var element in parsedList) {
      albumsList.add(Album.fromJson(element));
    }
    return albumsList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
