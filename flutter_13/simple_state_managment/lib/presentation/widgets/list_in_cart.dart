import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_managment/domain/cart_manager.dart';
import 'package:simple_state_managment/presentation/widgets/item_card.dart';

class ListInCart extends StatefulWidget {
  const ListInCart({super.key});

  @override
  State<ListInCart> createState() => _ListInCartState();
}

class _ListInCartState extends State<ListInCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, state, child) {
      return CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: state.listOfItems.length,
              itemBuilder: (context, index) =>
                  ItemCard(item: state.listOfItems[index]))
        ],
      );
    });
  }
}
