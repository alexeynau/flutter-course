import 'package:flutter/material.dart';

// this app shows usage of LayoutBuilder

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (builder, contraints) {
            double _width = contraints.constrainWidth();

            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    scrollDirection:
                        (_width > 500) ? Axis.vertical : Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisCount: 1,
                      mainAxisExtent: (_width > 500) ? 200 : 100,
                    ),
                    itemCount: cards.length,
                    itemBuilder: (context, index) => cards[index],
                  ),
                ),
                if (_width < 500)
                  Expanded(
                    flex: 6,
                    child: Container(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}


// items for list
List<Card> cards = List.generate(
  50,
  (index) => Card(
    color: Color(0xBB00FF00 + index * 16 * 2),
  ),
);

