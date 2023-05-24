import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_managment/domain/cart_manager.dart';

import '../../data/models/item_model.dart';

class ItemCard extends StatefulWidget {
  final ItemModel item;
  const ItemCard({super.key, required this.item});
  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            widget.item.name,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(widget.item.about),
          ElevatedButton(
            onPressed: () => context.read<Cart>().addToCart(widget.item),
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
