import 'package:flutter/material.dart';
import 'package:simple_state_managment/data/models/item_model.dart';

class Cart with ChangeNotifier {
  List<ItemModel> listOfItems = [];

  int bottomIndex = 0;

  void addToCart(ItemModel item){
    listOfItems.add(item);
    notifyListeners();
  }

  void changeBottomIndex() {
    bottomIndex = bottomIndex == 0 ? 1 : 0; 
    notifyListeners();
  }
}