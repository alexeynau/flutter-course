import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_managment/presentation/widgets/list_in_cart.dart';
import 'package:simple_state_managment/presentation/widgets/list_of_items.dart';

import '../domain/cart_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      create: (_) => Cart(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: Consumer<Cart>(
            builder: (context, value, child) {
              int index = value.bottomIndex;
              return index == 0 ? const ListOfItems() : const ListInCart();
            },
          ),
          bottomNavigationBar: Consumer<Cart>(builder: (context, state, child) {
            int _bottomIndex = 0;
            return BottomNavigationBar(
              currentIndex: _bottomIndex,
              onTap: (value) {
                context.read<Cart>().changeBottomIndex();
                
                setState(() {
                  _bottomIndex = value;
                });
                
              },
              items: const [
                BottomNavigationBarItem(
                  label: 'Товары',
                  icon: Icon(Icons.shopping_bag_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Корзина',
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
