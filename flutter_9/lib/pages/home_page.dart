import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_9/entity/hotel.dart';
import 'package:flutter_9/ui/hotel_card_small.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isGrid = true;
  bool _isLoading = false;
  bool _hasError = false;
  late String errorMessage;
  Dio _dio = Dio();
  String urlBase = 'https://run.mocky.io/v3/';
  String uuid = 'ac888dc5-d193-4700-b12c-abb43e289301';
  List<HotelPreview> hotelPreviews = [];
  List<Hotel> hotels = [];
  late List<HotelCardSmall> listOfSmallCards;

  @override
  void initState() {
    super.initState();

    getDataDioFrom(urlBase + uuid);
  }

  getDataDioFrom(String url) async {
    setState(() {
      _isLoading = true;
    });
    try {
      var response = await _dio.get(url);
      List data = response.data;
      hotelPreviews = data
          .map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel))
          .toList();
      //print(hotelPreviews);
     
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
        title: Text('Hotels'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isGrid = false;
              });
            },
            icon: const Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isGrid = true;
              });
            },
            icon: const Icon(Icons.grid_view_rounded),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _isGrid
              ? SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemCount: hotelPreviews.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(15),
                      child: HotelCardSmall(
                        hotelPreview: hotelPreviews[index],
                      ),
                    );
                  },
                )
              : 
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: hotelPreviews.length,
                    (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(15),
                      child: HotelCardSmall(
                        hotelPreview: hotelPreviews[index],
                      ),
                    );
                  }),
                ),
        ],
      ),
    );
  }
}
