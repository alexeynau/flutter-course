import 'package:bloc_managment/data/models/item_model.dart';
import 'package:flutter/material.dart';
// import '../../domain/main_bloc.dart';
import '../../presentation/widgets/item_card.dart';

class ListInCart extends StatelessWidget {
  final List<ItemModel> listOfItems;
  const ListInCart({
    super.key,
    required this.listOfItems,

  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: listOfItems.length,
          itemBuilder: (context, index) => ItemCard(
            item: listOfItems[index],

          ),
        )
      ],
    );
  }
}
