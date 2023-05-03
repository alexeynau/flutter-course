import 'package:flutter/material.dart';
import 'package:flutter_9/entity/hotel.dart';
import 'package:flutter_9/pages/hotel_page.dart';

class HotelCardSmall extends StatefulWidget {
  HotelPreview hotelPreview;
  HotelCardSmall({super.key, required this.hotelPreview});

  @override
  State<HotelCardSmall> createState() => _HotelCardSmallState();
}

class _HotelCardSmallState extends State<HotelCardSmall> {

@override
void initState() {
  super.initState();
  print(widget.hotelPreview.name);
}

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [

          // image
          Expanded(
            flex: 3,
            child: Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Image.asset(
                'assets/images/${widget.hotelPreview.poster!}',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // title
          Expanded(
            child: Center(
              child: SizedBox(
                child: Text(widget.hotelPreview.name!),
              ),
            ),
          ),

          // button
          Expanded(
            child: SizedBox(
              child: GestureDetector(
                onTap: () {
                  print('OK');
                  Navigator.of(context).pushNamed('/hotel', arguments: {
                    'hotel' : widget.hotelPreview,
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Подробнее',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
