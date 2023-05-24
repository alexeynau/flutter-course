import 'package:flutter/material.dart';

import '../../data/models/item_model.dart';
import '../../domain/main_bloc.dart';

class ItemCard extends StatefulWidget {
  final ItemModel item;
  final MainBloc bloc;
  const ItemCard({super.key, required this.item, required this.bloc});
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
            onPressed: () => widget.bloc.action.add(AddToCart(widget.item)),
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
