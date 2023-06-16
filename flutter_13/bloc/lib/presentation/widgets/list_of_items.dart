import 'package:flutter/material.dart';
import '../../data/repositories/item_repository_impl.dart';
// import '../../domain/main_bloc.dart';
import '../../domain/repositories/item_repository.dart';

import 'item_card.dart';

class ListOfItems extends StatelessWidget {
  //final MainBloc bloc;
  ListOfItems({
    super.key,
    //required this.bloc,
  });

  final ItemRepository itemRepository = ItemRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: itemRepository.getAllItems(),
        builder: (context, snapshot) {
          print(snapshot.data?.length);
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return CustomScrollView(slivers: [
                SliverList.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (snapshot.data != null) {
                        return ItemCard(
                          item: snapshot.data![index],
                        );
                      }
                      else {
                        return Container();
                      }
                    })
              ]);
            default:
              return CircularProgressIndicator();
          }
        });
  }
}
