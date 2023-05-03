import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_9/entity/hotel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HotelPage extends StatefulWidget {
  static const String routeName = '/hotel';
  final HotelPreview hotel;
  HotelPage({super.key, required this.hotel});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  bool _isLoading = false;
  bool _hasError = false;
  late String errorMessage;
  Dio _dio = Dio();
  String urlBase = 'https://run.mocky.io/v3/';
  String uuid = 'ac888dc5-d193-4700-b12c-abb43e289301';
  late Hotel _hotel;
  List<Hotel> hotels = [];

  @override
  void initState() {
    super.initState();
    getDataDioFrom(urlBase + widget.hotel.uuid!);
  }

  getDataDioFrom(String url) async {
    setState(() {
      _isLoading = true;
    });
    try {
      var response = await _dio.get(url);
      var data = response.data;
      _hotel = Hotel.fromJson(data);
      print(_hotel);
      // for (var hotelPreview in hotelPreviews) {
      //   response =  await _dio.get(urlBase + hotelPreview.uuid!);
      //   data = response.data;
      //   hotels.add(Hotel.fromJson(data));

      //   print(hotels);
      // }
      // print(hotels);
    } on DioError catch (e) {
      errorMessage = e.response!.data['message'];
      _hasError = true;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_hotel.name!),
      ),
      body: Container(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: _hotel.photos!.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Image.asset(
                        'assets/images/$i',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Column(
              children: [
                Text('Страна: ${_hotel.address!.country}'),
                Text('Город: ${_hotel.address!.city}'),
                Text('Улица: ${_hotel.address!.street}'),
                Text('Рейтинг: ${_hotel.rating}'),
              ],
            ),
            Text('Сервисы:'),
            Row(
              children: [
                Column(
                  children: [
                    Text('Платные'),
                    ..._hotel.services!.paid!.map((e) => Text(e)).toList()
                  ],
                ),
                Column(
                  children: [
                    Text('Бесплатные'),
                    ..._hotel.services!.free!.map((e) => Text(e)).toList()
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
