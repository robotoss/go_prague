

import 'models/toursData.dart';
import 'network/rest_ds.dart';

class Repository {

  RestDataSource api = RestDataSource();

  ///Список Туров
  Future<List<ToursData>> accountTypes() async {
    return api.toursList();
  }
}