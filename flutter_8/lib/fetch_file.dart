import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) {
  return rootBundle.loadString(assetsPath).then((file) => file.toString()).catchError((e) {
    print(e.toString());
    return 'Файл не найден';
  });
}

