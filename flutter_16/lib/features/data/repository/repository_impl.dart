import 'dart:io';

import 'package:flutter_16/features/data/models/person_model.dart';
import 'package:flutter_16/features/domain/repository/repository.dart';

class RepositoryImpl implements Repository {

  /// Takes json from assets and return List<PersonModel>
  @override
  Future<List<PersonModel>> getPersonsList() async{
    List<PersonModel> listOfItems = [];
    await File('assets/data/persons.json')
      .readAsString()
      .then((fileContents) => listOfItems = personModelFromJson(fileContents));
    print(listOfItems.first.toJson());
    return listOfItems;
  }
  
}