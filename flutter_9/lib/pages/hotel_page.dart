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
    } on DioError catch (e) {
      errorMessage = e.response!.data['message'];
      _hasError = true;
      print('has error');
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            appBar: AppBar(),
            body: const Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(!_hasError ? _hotel.name! : 'Ошибка'),
            ),
            body: _hasError
                ? const Center(child: Text('Контент временно недоступен'))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(height: 400.0),
                          items: _hotel.photos!.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration:
                                      const BoxDecoration(color: Colors.amber),
                                  child: Image.asset(
                                    'assets/images/$i',
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),

                        //address
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Страна: ${_hotel.address!.country}'),
                                Text('Город: ${_hotel.address!.city}'),
                                Text('Улица: ${_hotel.address!.street}'),
                                Text('Рейтинг: ${_hotel.rating}'),
                              ],
                            ),
                          ),
                        ),
                        const Text('Сервисы:'),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Платные:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  ..._hotel.services!.paid!
                                      .map((e) => Text(e))
                                      .toList()
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Бесплатные:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  ..._hotel.services!.free!
                                      .map((e) => Text(e))
                                      .toList()
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
  }
}
