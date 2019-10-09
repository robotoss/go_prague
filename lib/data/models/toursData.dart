// To parse this JSON data, do
//
//     final toursData = toursDataFromJson(jsonString);

import 'dart:convert';

List<ToursData> toursDataFromJson(String str) => List<ToursData>.from(json.decode(str).map((x) => ToursData.fromJson(x)));

String toursDataToJson(List<ToursData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToursData {
  String language;
  String name;
  bool mainScreen;
  String category;
  List<String> imgUrls;
  String article;
  String duration;
  int price;
  int freeSpace;

  ToursData({
    this.language,
    this.name,
    this.mainScreen,
    this.category,
    this.imgUrls,
    this.article,
    this.duration,
    this.price,
    this.freeSpace,
  });

  factory ToursData.fromJson(Map<String, dynamic> json) => ToursData(
    language: json["language"],
    name: json["name"],
    mainScreen: json["mainScreen"],
    category: json["category"],
    imgUrls: List<String>.from(json["imgUrls"].map((x) => x)),
    article: json["article"],
    duration: json["duration"],
    price: json["price"],
    freeSpace: json["FreeSpace"],
  );

  Map<String, dynamic> toJson() => {
    "language": language,
    "name": name,
    "mainScreen": mainScreen,
    "category": category,
    "imgUrls": List<dynamic>.from(imgUrls.map((x) => x)),
    "article": article,
    "duration": duration,
    "price": price,
    "FreeSpace": freeSpace,
  };
}
