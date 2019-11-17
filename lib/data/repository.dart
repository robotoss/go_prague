

import 'models/cityBarItems.dart';
import 'models/cityRestaurantItems.dart';
import 'models/cityServices.dart';
import 'models/hotelBarItems.dart';
import 'models/hotelRestaurantItems.dart';
import 'models/hotelServices.dart';
import 'models/toursData.dart';
import 'models/upcomingEvents.dart';
import 'network/rest_ds.dart';

class Repository {

  RestDataSource api = RestDataSource();

  ///Список Туров
  Future<List<ToursData>> accountTypes() async {
    return api.toursList();
  }

  ///Список блюд в Рестаране отеля
  Future<List<HotelRestaurantItems>> hotelRestaurantList() async {
    return api.hotelRestaurantList();
  }

  ///Список блюд в Городе
  Future<List<CityRestaurantItems>> cityRestaurantList() async {
    return api.cityRestaurantList();
  }

  ///Список напитков в Рестаране отеля
  Future<List<HotelBartItems>> hotelBarList() async {
    return api.hotelBarList();
  }

  ///Список напитков в Городе
  Future<List<CityBarItems>> cityBarList() async {
    return api.cityBarList();
  }

  ///Список ближайших событий
  Future<List<UpcomingEvents>> upcomingEventsList() async {
    return api.upcomingEventsList();
  }

  ///Список услуг Отеля
  Future<List<HotelServices>> hotelService() async {
    return api.hotelService();
  }

  ///Список услуг города
  Future<List<CityServices>> cityService() async {
    return api.cityService();
  }
}