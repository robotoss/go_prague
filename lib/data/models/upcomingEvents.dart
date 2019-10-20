// To parse this JSON data, do
//
//     final upcomingEvents = upcomingEventsFromJson(jsonString);

import 'dart:convert';

List<UpcomingEvents> upcomingEventsFromJson(String str) => List<UpcomingEvents>.from(json.decode(str).map((x) => UpcomingEvents.fromJson(x)));

String upcomingEventsToJson(List<UpcomingEvents> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpcomingEvents {
  String language;
  String name;
  bool mainScreen;
  List<String> imgUrls;
  String article;
  String startTime;
  int price;
  int freeSpace;
  String place;

  UpcomingEvents({
    this.language,
    this.name,
    this.mainScreen,
    this.imgUrls,
    this.article,
    this.startTime,
    this.price,
    this.freeSpace,
    this.place,
  });

  factory UpcomingEvents.fromJson(Map<String, dynamic> json) => UpcomingEvents(
    language: json["language"],
    name: json["name"],
    mainScreen: json["mainScreen"],
    imgUrls: List<String>.from(json["imgUrls"].map((x) => x)),
    article: json["article"],
    startTime: json["startTime"],
    price: json["price"],
    freeSpace: json["FreeSpace"],
    place: json["place"],
  );

  Map<String, dynamic> toJson() => {
    "language": language,
    "name": name,
    "mainScreen": mainScreen,
    "imgUrls": List<dynamic>.from(imgUrls.map((x) => x)),
    "article": article,
    "startTime": startTime,
    "price": price,
    "FreeSpace": freeSpace,
    "place": place,
  };
}
