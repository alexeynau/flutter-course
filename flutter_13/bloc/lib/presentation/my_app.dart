import 'package:bloc/domain/main_bloc.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    bloc = MainBloc();
  }

  @override
  void dispose() {
    bloc = MainBloc();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Builder(
          builder: (context) {
            int index = _bottomIndex;
            return index == 0
                ? ListOfItems(
                    bloc: bloc,
                  )
                : StreamBuilder(
                    stream: bloc.state,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          return ListInCart(
                            listOfItems: snapshot.data!,
                            bloc: bloc,
                          );

                        default:
                          return Text('Тут ничего нет');
                      }
                    });
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
