import 'package:bloc_managment/data/models/item_model.dart';
import 'package:bloc_managment/domain/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
import '../presentation/widgets/list_in_cart.dart';
import '../presentation/widgets/list_of_items.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _bottomIndex = 0;
  late final MainBloc bloc;
  // @override
  // void initState() {
  //   super.initState();
  //   bloc = MainBloc();
  // }

  // @override
  // void dispose() {
  //   bloc = MainBloc();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        // body: Container(
        //   color: Colors.red,
        // ),
        body: Builder(
          builder: (context) {
            int index = _bottomIndex;
            return index == 0
                ? ListOfItems()
                : BlocBuilder<MainBloc, List<ItemModel>>(
                    buildWhen: (previous, current) {
                      print(current);
                      return true;
                    },
                    builder: (context, state) {
                      print(state);
                      if (state.isNotEmpty) {
                        return ListInCart(
                          listOfItems: state,
                        );
                      }
                      return const Text('Тут ничего нет');
                    },
                  );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomIndex,
          onTap: (value) {
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
        ),
      ),
    );
  }
}
