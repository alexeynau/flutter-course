import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  String image;
  DetailView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: image,
        child: Card(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(child: Image.asset(image)),
                  Expanded(child: Text(image)),
                ],
              ),

              // button view
              Positioned(
                top: 300,
                right: 30,
                child: GestureDetector(
                  onTap: () {},
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
    );
  }
}
