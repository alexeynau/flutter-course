// import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/item_model.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final ItemModel item;
  AddToCart(this.item);
}

class MainBloc extends Bloc<CartEvent, List<ItemModel>> {
  //List<ItemModel> listOfItems = [];

  // MainBloc(super.initialState);

  MainBloc() : super([]) {
    on<AddToCart>((event, emit) {
      print('Hello');
      state.add(event.item);
      emit(state);
    });
  }
  // Stream<List<ItemModel>> mapEventToState(Event event) async* {
  //   if (event is AddToCart) {
  //     listOfItems.add(event.item);
  //   }
  //   yield listOfItems;
}
  // final _stateController = StreamController<List<ItemModel>>();
  // final _eventController = StreamController<Event>();

  // Stream<List<ItemModel>> get state => _stateController.stream;

  // Sink<Event> get action => _eventController.sink;

  // MainBloc() {
  //   _eventController.stream.listen(_handleEvent);
  // }

  // void dispose() {
  //   _stateController.close();
  //   _eventController.close();
  // }

  // void _handleEvent(Event action) async {
  //   if (action is AddToCart) {
  //     listOfItems.add(action.item);
  //   }

  //   _stateController.add(listOfItems);
  // }
// }
