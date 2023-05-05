import 'package:flutter/material.dart';
import 'package:flutter_11/pages/detail_view.dart';

// home page that contains cards

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          // card list
          ...photos
              .map(
                (e) => Hero(
                  tag: e,
                  child: SizedBox(
                    height: 180,
                    width: double.maxFinite,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              //image
                              Expanded(
                                child: Image.asset(
                                  e,
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              //title
                              Expanded(
                                child: Center(
                                  child: Container(
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                    child: Center(child: Text(e)),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //button
                          Positioned(
                            bottom: 65,
                            right: 30,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return DetailView(image: e);
                                  }),
                                );
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                color: Colors.yellow,
                                child: const Icon(Icons.add),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ]),
      ),
    );
  }
}

List<String> photos =
    [1, 2, 3, 4, 5].map((e) => 'assets/images/space_$e.jpg').toList();
