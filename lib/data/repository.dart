

import 'models/hotelBarItems.dart';
import 'models/hotelRestaurantItems.dart';
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

  ///Список напитков в Рестаране отеля
  Future<List<HotelBartItems>> hotelBarList() async {
    return api.hotelBarList();
  }

  ///Список ближайших событий
  Future<List<UpcomingEvents>> upcomingEventsList() async {
    return api.upcomingEventsList();
  }
}