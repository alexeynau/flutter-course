import 'package:flutter/material.dart';
import '../../data/repositories/item_repository_impl.dart';
import '../../domain/main_bloc.dart';
import '../../domain/repositories/item_repository.dart';

import 'item_card.dart';

class ListOfItems extends StatefulWidget {
  final MainBloc bloc;
  const ListOfItems({super.key, required this.bloc});

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
                  itemBuilder: (context, index) => ItemCard(
                    item: snapshot.data![index],
                    bloc: widget.bloc,
                  ),
                )
              ]);
            default:
              return CircularProgressIndicator();
          }
        });
  }
}
