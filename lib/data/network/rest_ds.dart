
import 'package:dio/dio.dart';
import 'package:go_prague/data/models/cityBarItems.dart';
import 'package:go_prague/data/models/cityRestaurantItems.dart';
import 'package:go_prague/data/models/cityServices.dart';
import 'package:go_prague/data/models/hotelBarItems.dart';
import 'package:go_prague/data/models/hotelRestaurantItems.dart';
import 'package:go_prague/data/models/hotelServices.dart';
import 'package:go_prague/data/models/toursData.dart';
import 'package:go_prague/data/models/upcomingEvents.dart';

class RestDataSource {

  String serverUrl = 'https://api.npoint.io';
  Dio dio = new Dio();

  ///Список Туров
  Future<List<ToursData>> toursList() async {
    Response<String> response = await dio.get("$serverUrl/93462c117c4b12f63415");
    return toursDataFromJson(response.data);
  }

  ///Список блюд в Рестаране отеля
  Future<List<HotelRestaurantItems>> hotelRestaurantList() async {
    Response<String> response = await dio.get("$serverUrl/5d6b17ac532c586cd4b9");
    return hotelRestaurantItemsFromJson(response.data);
  }

  ///Список блюд в Городе
  Future<List<CityRestaurantItems>> cityRestaurantList() async {
    Response<String> response = await dio.get("$serverUrl/0afbf673183087005479");
    return cityRestaurantItemsFromJson(response.data);
  }

  ///Список напитков в Рестаране отеля
  Future<List<HotelBartItems>> hotelBarList() async {
    Response<String> response = await dio.get("$serverUrl/f4f36ff24ecfa73c29bd");
    return hotelBartItemsFromJson(response.data);
  }

  ///Список напитков в Городе
  Future<List<CityBarItems>> cityBarList() async {
    Response<String> response = await dio.get("$serverUrl/e48ae894af694a338b22");
    return cityBarItemsFromJson(response.data);
  }

  ///Список ближайших событий
  Future<List<UpcomingEvents>> upcomingEventsList() async {
    Response<String> response = await dio.get("$serverUrl/1bf47577f7851685da68");
    return upcomingEventsFromJson(response.data);
  }

  ///Список услуг Отеля
  Future<List<HotelServices>> hotelService() async {
    Response<String> response = await dio.get("$serverUrl/b7d31778a542e6ee6d0f");
    return hotelServicesFromJson(response.data);
  }

  ///Список услуг в Городе
  Future<List<CityServices>> cityService() async {
    Response<String> response = await dio.get("$serverUrl/915a6e70bed2c08cb15d");
    return cityServicesFromJson(response.data);
  }

}