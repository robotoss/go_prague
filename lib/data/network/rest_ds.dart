
import 'package:dio/dio.dart';
import 'package:go_prague/data/models/toursData.dart';

class RestDataSource {

  String serverUrl = 'https://api.npoint.io';
  Dio dio = new Dio();

  ///Список Туров
  Future<List<ToursData>> toursList() async {
    Response<String> response = await dio.get("$serverUrl/93462c117c4b12f63415");
    return toursDataFromJson(response.data);
  }

}