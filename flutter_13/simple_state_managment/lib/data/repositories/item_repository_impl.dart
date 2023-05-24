import 'dart:io';
import 'package:simple_state_managment/data/models/item_model.dart';
import 'package:simple_state_managment/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  @override
  Future<List<ItemModel>> getAllItems() async {
    List<ItemModel> listOfItems = [];
    await File('D:/flutter_course/flutter_13/simple_state_managment/lib/data/items.json')
      .readAsString()
      .then((fileContents) => listOfItems = itemModelFromJson(fileContents));

    return listOfItems;
  }
  
}