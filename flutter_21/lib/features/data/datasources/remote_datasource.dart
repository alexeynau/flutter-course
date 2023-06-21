import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

abstract class RemoteDatasource {
  Future<String> downloadImage(String url);
}

class RemoteDatasourceImpl implements RemoteDatasource {
  final http.Client httpClient = http.Client();

  @override
  Future<String> downloadImage(String url) async {
    Directory directory = await getApplicationDocumentsDirectory();

    String imageName = url.substring(url.lastIndexOf('/') + 1);
    var imagePath = join(directory.path, '$imageName');
    await httpClient.get(Uri.parse(url)).then((response) {
      File(imagePath).writeAsBytes(response.bodyBytes);
    }).onError((error, stackTrace) {
      throw Exception(error.toString());
    });
    return imagePath;
  }
}
