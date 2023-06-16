import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

import '../../data/models/item_model.dart';
import '../../domain/main_bloc.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;
  const ItemCard({
    super.key,
    required this.item,
  });

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
           item.name,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(item.about),
          ElevatedButton(
            onPressed: () =>
                BlocProvider.of<MainBloc>(context).add(AddToCart(item)),
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
