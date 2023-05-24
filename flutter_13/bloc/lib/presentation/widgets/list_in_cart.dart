import 'package:bloc/data/models/item_model.dart';
import 'package:flutter/material.dart';
import '../../domain/main_bloc.dart';
import '../../presentation/widgets/item_card.dart';

class ListInCart extends StatefulWidget {
  final List<ItemModel> listOfItems;
  final MainBloc bloc;
  const ListInCart({super.key, required this.listOfItems, required this.bloc});

  @override
  State<ListInCart> createState() => _ListInCartState();
}

class _ListInCartState extends State<ListInCart> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: widget.listOfItems.length,
          itemBuilder: (context, index) => ItemCard(
            item: widget.listOfItems[index],
            bloc: widget.bloc,
          ),
        )
      ],
    );
  }
}
