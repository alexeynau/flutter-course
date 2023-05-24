import 'dart:async';

import '../data/models/item_model.dart';

abstract class Event {}

class AddToCart extends Event {
  final ItemModel item;
  AddToCart(this.item);
}

class MainBloc {
  List<ItemModel> listOfItems = [];

  final _stateController = StreamController<List<ItemModel>>();
  final _eventController = StreamController<Event>();

  Stream<List<ItemModel>> get state => _stateController.stream;

  Sink<Event> get action => _eventController.sink;

  MainBloc() {
    _eventController.stream.listen(_handleEvent);
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }

  void _handleEvent(Event action) async {
    if (action is AddToCart) {
      listOfItems.add(action.item);
    }

    _stateController.add(listOfItems);
  }

}