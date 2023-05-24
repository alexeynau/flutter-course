import 'package:flutter/material.dart';
import 'package:simple_state_managment/data/repositories/item_repository_impl.dart';
import 'package:simple_state_managment/domain/repositories/item_repository.dart';

import 'item_card.dart';

class ListOfItems extends StatefulWidget {
  const ListOfItems({super.key});

  @override
  State<ListOfItems> createState() => _ListOfItemsState();
}

class _ListOfItemsState extends State<ListOfItems> {
  ItemRepository itemRepository = ItemRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: itemRepository.getAllItems(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return CustomScrollView(slivers: [
                SliverList.builder(
                  itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) =>
                        ItemCard(item: snapshot.data![index]))
              ]);
            default:
              return CircularProgressIndicator();
          }
        });
  }
}
